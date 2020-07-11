# frozen_string_literal: true

require 'test_helper'

class StageResultsFetchJobTest < ActiveJob::TestCase
  setup do
    stub_stage_results
    stub_team_results

    @stage = stages(:tdf_2019_4)
    @tour = @stage.tour
  end

  test '#perform fetches results for stage' do
    player_count = Registration.where(year: @tour.year).count
    player_rider_points_counter = lambda do
      @tour.reload.overall_results.reduce(0) { |count, result| count + result.player_rider_points.count }
    end
    player_rider_stage_points_counter = lambda do
      @stage.reload.stage_results.reduce(0) { |count, result| count + result.player_rider_stage_points.count }
    end

    record_counts = {
      -> { @stage.stage_results.count } => 2,
      -> { @tour.overall_results.count } => 0,
      player_rider_points_counter => player_count * 15,
      player_rider_stage_points_counter => player_count * 15,
      -> { @tour.riders.count } => 15
    }

    assert_difference record_counts do
      StageResultsFetchJob.perform_now(@stage.id)
    end
  end

  test '#perform saves stage results' do
    StageResultsFetchJob.new.perform(@stage.id)

    results = @stage.stage_results.first
    assert_equal 38, results.overall_rank
    assert_equal 'Jim Hopper', results.player.name
    assert_equal 52, results.percentile
    assert_equal 53, results.points
  end

  test '#perform saves overall results' do
    StageResultsFetchJob.new.perform(@stage.id)

    results = @tour.overall_results.last
    assert_equal Date.new(2019, 7, 9), results.date
    assert_equal(-41, results.gap)
    assert_equal 28, results.overall_rank
    assert_equal 28, results.previous_rank
    assert_equal 'Will Byers', results.player.name
    assert_equal 89, results.percentile
    assert_equal 176, results.points
  end

  test '#perform saves player rider points' do
    StageResultsFetchJob.new.perform(@stage.id)

    points = overall_results(:tdf_2019_jim_hopper).player_rider_points.last
    assert_equal 15, points.ordinal
    assert_equal 0, points.points
    assert_equal 'D. Martin', points.rider.name
  end

  test '#perform saves player rider stage points' do
    StageResultsFetchJob.new.perform(@stage.id)

    points = @stage.stage_results.first.player_rider_stage_points.last
    assert_equal 0, points.points
    assert_equal 'D. Martin', points.rider.name
  end

  test '#perform saves rider' do
    StageResultsFetchJob.new.perform(@stage.id)

    assert_equal 'P. Sagan', @tour.riders.first.name
    assert_equal 'D. Martin', @tour.riders.last.name
  end

  test '#perform logs on start and success' do
    message = "Updating stage results for stage #{@stage.date} (id: #{@stage.id})"
    Rails.logger.expects(:info).with(message)
    message = "Updated stage results for 2 players for stage #{@stage.date} (id: #{@stage.id})"
    Rails.logger.expects(:info).with(message)

    StageResultsFetchJob.new.perform(@stage.id)
  end

  test '#perform updates results updated timestamp' do
    assert_nil @stage.results_downloaded_at

    StageResultsFetchJob.new.perform(@stage.id)

    refute_nil @stage.reload.results_downloaded_at
  end

  test '#perform creates rider when need' do
    assert_difference -> { @tour.riders.count } => 15 do
      StageResultsFetchJob.perform_now(@stage.id)
    end
  end

  test '#perform does not create rider when it exists' do
    @tour.riders.create!(name: 'P. Sagan')

    assert_difference -> { @tour.riders.count } => 14 do
      StageResultsFetchJob.perform_now(@stage.id)
    end
  end

  test '#perform creates player rider points when need' do
    assert_difference -> { PlayerRiderPoints.count } => @tour.overall_results.count * 15 do
      StageResultsFetchJob.perform_now(@stage.id)
    end
  end

  test '#perform does not create player rider points when it exists' do
    rider = @tour.riders.create!(name: 'P. Sagan')
    overall_result = overall_results(:tdf_2019_jim_hopper)

    overall_result.player_rider_points.create!(ordinal: 1, points: 1, rider: rider)

    assert_difference -> { PlayerRiderPoints.count } => (@tour.overall_results.count * 15) - 1 do
      StageResultsFetchJob.perform_now(@stage.id)
    end
  end

  test '#perform creates player rider stage points when need' do
    player_count = Registration.where(year: @tour.year).count

    assert_difference -> { PlayerRiderStagePoints.count } => player_count * 15 do
      StageResultsFetchJob.perform_now(@stage.id)
    end
  end

  test '#perform does not create player rider stage points when it exists' do
    StageResultsFetchJob.perform_now(@stage.id)
    @stage.stage_results.first.player_rider_stage_points.first.destroy

    assert_difference -> { PlayerRiderStagePoints.count } => 1 do
      StageResultsFetchJob.perform_now(@stage.id)
    end
  end

  test '#perform makes no changes on error' do
    StageResultsFetcher.expects(:perform).raises(StandardError, 'Boom!')

    record_counts = [
      -> { StageResult.count },
      -> { OverallResult.count },
      -> { PlayerRiderPoints.count },
      -> { PlayerRiderStagePoints.count },
      -> { Rider.count }
    ]
    assert_no_difference record_counts do
      StageResultsFetchJob.perform_now(@stage.id)
    end

    assert_nil @stage.reload.results_downloaded_at
  end

  test '#perform logs on error' do
    StageResultsFetcher.expects(:perform).raises(StandardError, 'Boom!')
    message = /^Failed to update stage result: Boom!.*/
    Rails.logger.expects(:error).with(regexp_matches(message))

    StageResultsFetchJob.new.perform(@stage.id)
  end

  private

  def stub_stage_results
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getlines.cgi?DATE=20190709&SEARCH=Jim%20Hopper')
      .to_return(status: 200, body: html_fixture('stage_results'))
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getlines.cgi?DATE=20190709&SEARCH=Will%20Byers')
      .to_return(status: 200, body: html_fixture('stage_results'))
  end

  def stub_team_results
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getpart.cgi?SEARCH=Jim%20Hopper&YEAR=2019')
      .to_return(status: 200, body: html_fixture('team_results'))
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getpart.cgi?SEARCH=Will%20Byers&YEAR=2019')
      .to_return(status: 200, body: html_fixture('team_results'))
  end
end
