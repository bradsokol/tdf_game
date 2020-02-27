# frozen_string_literal: true

require 'test_helper'

class StageResultsFetcherTest < ActiveSupport::TestCase
  setup do
    @stage_result = StageResult.new
    stub_stage_results
  end

  test 'perform returns stage results' do
    results = StageResultsFetcher.perform(stage_date: date, player_name: 'Eddie Merckx', stage_result: @stage_result)

    assert_instance_of(StageResult, results)
    assert_not_nil results.overall_rank
    assert_not_nil results.points
  end

  private

  def date
    @date ||= Time.new(2020, 2, 26)
  end

  def stub_stage_results
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getlines.cgi?DATE=20200226&SEARCH=Eddie%20Merckx')
      .to_return(status: 200, body: html_fixture('stage_results'))
  end
end
