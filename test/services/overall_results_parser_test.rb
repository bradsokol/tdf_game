# frozen_string_literal: true

require 'test_helper'

class OverallResultsParserTest < ActiveSupport::TestCase
  setup do
    @html = Nokogiri::HTML(html_fixture('stage_results'))
    @overall_result = OverallResult.new
  end

  test 'perform parses overall results' do
    OverallResultsParser.perform(html: @html, overall_result: @overall_result)

    assert_equal 28, @overall_result.overall_rank
    assert_equal 28, @overall_result.previous_rank
    assert_equal 176, @overall_result.points
    assert_equal(-41, @overall_result.gap)
  end
end
