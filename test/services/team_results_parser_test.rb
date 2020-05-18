# frozen_string_literal: true

require 'test_helper'

class TeamResultsParserTest < ActiveSupport::TestCase
  setup do
    @html = Nokogiri::HTML(html_fixture('team_results'))
  end

  test 'perform parses riders' do
    team_results = TeamResultsParser.perform(html: @html)

    assert_equal 15, team_results.riders.length

    rider = team_results.riders.first
    assert_equal 1, rider.ordinal
    assert_equal 'P. Sagan', rider.name
    assert_equal 138, rider.total_points
    assert_equal [15, 15, 18, 0, 15, 15, 0, 15, 15, 0, 0, 0, 0, 15, 0, 0, 0, 0, 15], rider.daily_points

    rider = team_results.riders.last
    assert_equal 15, rider.ordinal
    assert_equal 'D. Martin', rider.name
    assert_equal 0, rider.total_points
    assert_equal Array.new(19, 0), rider.daily_points
  end

  test 'perform parses total points' do
    team_results = TeamResultsParser.perform(html: @html)

    expected_points = [676, 48, 51, 43, 38, 54, 67, 0, 40, 47, 0, 36, 53, 37, 53, 0, 15, 26, 28, 40]
    assert_equal expected_points, team_results.total_points
  end

  test 'peform parses percentiles' do
    team_results = TeamResultsParser.perform(html: @html)

    expected_points = [89, 70, 52, 65, 74, 54, 90, 0, 42, 55, 0, 79, 83, 73, 57, 0, 38, 46, 44, 77]
    assert_equal expected_points, team_results.percentiles
  end

  test 'perform logs an error if parsing riders fails' do
    html = fixture_with_invalid_line(/^ 1. P. Sagan.*$/)

    Rails.logger
         .expects(:error)
         .with('[TeamResults] Failed to parse rider: THIS IS INVALID')

    assert_raises do
      TeamResultsParser.perform(html: html)
    end
  end

  test 'perform logs an error if parsing total points fails' do
    html = fixture_with_invalid_line(/^Ranking: 31.*$/)

    Rails.logger
         .expects(:error)
         .with('[TeamResults] Failed to parse point totals: THIS IS INVALID')

    assert_raises do
      TeamResultsParser.perform(html: html)
    end
  end

  test 'perform logs an error if parsing percentiles fails' do
    html = fixture_with_invalid_line(/[ ]*Percentiles:.*$/)

    Rails.logger
         .expects(:error)
         .with('[TeamResults] Failed to parse percentiles: THIS IS INVALID')

    assert_raises do
      TeamResultsParser.perform(html: html)
    end
  end

  private

  def fixture_with_invalid_line(pattern)
    file_path = Rails.root.join('test', 'fixtures', 'html', 'team_results.html')
    data = File.read(file_path).gsub(pattern, 'THIS IS INVALID')
    Nokogiri::HTML(data)
  end
end
