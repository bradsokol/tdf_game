# frozen_string_literal: true

require 'test_helper'

class StageResultsFetchJobTest < ActiveJob::TestCase
  setup do
    stub_stage_results
    @stage = stages(:tdf_2019_4)
  end

  test '#perform fetches results for stage' do
    StageResultsFetchJob.perform_now(@stage.id)

    assert_equal 2, @stage.stage_results.count
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

  test '#perform makes no changes on error' do
    StageResultsFetcher.expects(:perform).raises(StandardError, 'Boom!')

    assert_no_difference 'StageResult.count' do
      StageResultsFetchJob.perform_now(@stage.id)
    end

    assert_nil @stage.reload.results_downloaded_at
  end

  test '#perform logs on error' do
    StageResultsFetcher.expects(:perform).raises(StandardError, 'Boom!')
    message = 'Failed to update stage result: Boom!'
    Rails.logger.expects(:error).with(message)

    StageResultsFetchJob.new.perform(@stage.id)
  end

  private

  def stub_stage_results
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getlines.cgi?DATE=20190709&SEARCH=Jim%20Hopper')
      .to_return(status: 200, body: html_fixture('stage_results'))
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getlines.cgi?DATE=20190709&SEARCH=Will%20Byers')
      .to_return(status: 200, body: html_fixture('stage_results'))
  end
end
