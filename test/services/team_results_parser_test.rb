# typed: false
# frozen_string_literal: true

require 'test_helper'

class TeamResultsParserTest < ActiveSupport::TestCase
  extend T::Sig

  setup do
    html = Nokogiri::HTML(html_fixture('team_results'))
    @team_results = TeamResultsParser.perform(html:)
    @stage_numbers = Array(3..21)
  end

  test 'perform parses riders' do
    assert_equal 15, @team_results.riders.length

    rider = @team_results.riders.first
    assert_equal 1, rider.ordinal
    assert_equal 'P. Sagan', rider.name
    assert_equal 138, rider.total_points
    expected_stage_points = @stage_numbers.zip([15, 15, 18, 0, 15, 15, 0, 15, 15, 0, 0, 0, 0, 15, 0, 0, 0, 0, 15]).to_h
    assert_equal expected_stage_points, rider.stage_points

    rider = @team_results.riders.last
    assert_equal 15, rider.ordinal
    assert_equal 'D. Martin', rider.name
    assert_equal 0, rider.total_points
    expected_stage_points = @stage_numbers.zip(Array.new(19, 0)).to_h
    assert_equal expected_stage_points, rider.stage_points
  end

  test 'perform parses stage points' do
    expected_points = [48, 51, 43, 38, 54, 67, 0, 40, 47, 0, 36, 53, 37, 53, 0, 15, 26, 28, 40]
    assert_equal @stage_numbers.zip(expected_points).to_h, @team_results.stage_points
  end

  test 'perform parses total points' do
    assert_equal 676, @team_results.total_points
  end

  test 'perform parses overall percentile' do
    assert_equal 89, @team_results.overall_percentile
  end

  test 'perform parses stage percentiles' do
    expected_percentiles =
      @stage_numbers
      .zip([70, 52, 65, 74, 54, 90, 0, 42, 55, 0, 79, 83, 73, 57, 0, 38, 46, 44, 77])
      .to_h
    assert_equal expected_percentiles, @team_results.stage_percentiles
  end

  test 'perform parses scores for rider that abandoned' do
    rider = @team_results.riders[6]

    assert_equal 7, rider.ordinal
    assert_equal 'J. Fuglsang', rider.name
    assert_equal 18, rider.total_points
    points = [0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 9, 0, nil, nil, nil, nil, nil, nil]
    expected_stage_points = @stage_numbers.zip(points).to_h
    assert_equal expected_stage_points, rider.stage_points
  end

  test 'perform skips rider if parsing fails' do
    html = fixture_with_invalid_line(/^ 1. P. Sagan.*$/)

    results = TeamResultsParser.perform(html:)

    assert_equal 14, results.riders.length
    assert_empty(results.riders.select { |r| r.name == 'P. Sagan' })
  end

  test 'perform logs an error if parsing total points fails' do
    html = fixture_with_invalid_line(/^Ranking: 31.*$/)

    Rails.logger
         .expects(:error)
         .with('[TeamResults] Failed to parse point totals: THIS IS INVALID')

    assert_raises do
      TeamResultsParser.perform(html:)
    end
  end

  test 'perform logs an error if parsing percentiles fails' do
    html = fixture_with_invalid_line(/ *Percentiles:.*$/)

    Rails.logger
         .expects(:error)
         .with('[TeamResults] Failed to parse percentiles: THIS IS INVALID')

    assert_raises do
      TeamResultsParser.perform(html:)
    end
  end

  private

  sig { params(pattern: Regexp).returns(Nokogiri::HTML::Document) }
  def fixture_with_invalid_line(pattern)
    file_path = Rails.root.join('test/fixtures/html/team_results.html')
    data = File.read(file_path).gsub(pattern, 'THIS IS INVALID')
    Nokogiri::HTML(data)
  end
end
