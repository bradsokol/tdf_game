# frozen_string_literal: true

require 'test_helper'

class StageResultsParserTest < ActiveSupport::TestCase
  setup do
    stub_stage_results
  end

  test 'perform parses points and rank' do
    result = StageResultsParser.perform(html: Nokogiri::HTML(html_fixture('stage_results')))

    assert_equal 38, result.overall_rank
    assert_equal 53, result.points
  end

  private

  def stub_stage_results
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getlines.cgi?DATE=20200226&SEARCH=Eddie%20Merckx')
      .to_return(status: 200, body: html_fixture('stage_results'))
  end
end
