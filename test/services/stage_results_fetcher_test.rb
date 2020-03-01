# frozen_string_literal: true

require 'test_helper'

class StageResultsFetcherTest < ActiveSupport::TestCase
  setup do
    @overall_result = OverallResult.new
    @stage_result = StageResult.new
    stub_stage_results
  end

  test 'perform returns stage results' do
    results = StageResultsFetcher
              .perform(
                stage_date: date,
                player_name: 'Eddie Merckx',
                overall_result: @overall_result,
                stage_result: @stage_result
              )
              .stage_result

    assert_instance_of(StageResult, results)
    assert_not_nil results.overall_rank
    assert_not_nil results.points
  end

  test 'perform returns overall results' do
    results = StageResultsFetcher
              .perform(
                stage_date: date,
                player_name: 'Eddie Merckx',
                overall_result: @overall_result,
                stage_result: @stage_result
              )
              .overall_result

    assert_instance_of(OverallResult, results)
    assert_equal date, results.date
  end

  private

  def date
    @date ||= Date.new(2020, 2, 26)
  end

  def stub_stage_results
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getlines.cgi?DATE=20200226&SEARCH=Eddie%20Merckx')
      .to_return(status: 200, body: html_fixture('stage_results'))
  end
end
