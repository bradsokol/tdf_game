# frozen_string_literal: true

require 'test_helper'

class StageResultsParserTest < ActiveSupport::TestCase
  setup do
    @html = Nokogiri::HTML(html_fixture('stage_results'))
    @stage_result = StageResult.new
  end

  test 'perform parses points and rank' do
    StageResultsParser.perform(html: @html, stage_result: @stage_result)

    assert_equal 38, @stage_result.overall_rank
    assert_equal 53, @stage_result.points
  end

  test 'performs logs an error if parsing fails' do
    html = Nokogiri::HTML(html_fixture('stage_results_invalid_format'))

    Rails.logger
         .expects(:error)
         .with('[StageResults] Failed to parse stage results:   THIS IS INVALID')

    assert_raises do
      StageResultsParser.perform(html: html, stage_result: @stage_result)
    end
  end
end
