# typed: true
# frozen_string_literal: true

require 'test_helper'

class TeamResultsFetcherTest < ActiveSupport::TestCase
  extend T::Sig

  setup do
    stub_team_results
  end

  test 'perform returns team results' do
    results = TeamResultsFetcher.perform(year: 2019, player_name: 'Jim Hopper')

    assert_instance_of(TeamResultsParser::TeamResults, results)
    assert_equal 15, results.riders.length
    assert_equal 19, results.stage_points.length
    assert_equal 19, results.stage_percentiles.length
  end

  private

  sig { void }
  def stub_team_results
    stub_request(:get, 'https://ifarm.nl/cgi-bin/getpart.cgi?SEARCH=Jim%20Hopper&YEAR=2019')
      .to_return(status: 200, body: html_fixture('team_results'))
  end
end
