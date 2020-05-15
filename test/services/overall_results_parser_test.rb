# frozen_string_literal: true

require 'test_helper'

class OverallResultsParserTest < ActiveSupport::TestCase
  setup do
    @overall_result = OverallResult.new
  end

  test 'perform parses overall results' do
    html = Nokogiri::HTML(html_fixture('stage_results'))
    OverallResultsParser.perform(html: html, overall_result: @overall_result)

    assert_equal 28, @overall_result.overall_rank
    assert_equal 28, @overall_result.previous_rank
    assert_equal 176, @overall_result.points
    assert_equal(-41, @overall_result.gap)
  end

  test 'perform parses overall results from first day' do
    html = Nokogiri::HTML(html_fixture('stage_results_first_day'))
    OverallResultsParser.perform(html: html, overall_result: @overall_result)

    assert_equal 77, @overall_result.overall_rank
    assert_nil @overall_result.previous_rank
    assert_equal 48, @overall_result.points
    assert_equal(-32, @overall_result.gap)
  end

  test 'performs logs an error if parsing fails' do
    html = Nokogiri::HTML(html_fixture('stage_results_invalid_format'))

    Rails.logger
      .expects(:error)
      .with('[OverallResults] Failed to parse overall results:   THIS IS INVALID')

    assert_raises do
      OverallResultsParser.perform(html: html, overall_result: @overall_result)
    end
  end
end
