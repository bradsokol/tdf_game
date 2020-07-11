# frozen_string_literal: true

require 'test_helper'

class OverallResultsQueryTest < ActionDispatch::IntegrationTest
  test 'query overall results return results' do
    post('/graphql', params: { query: overall_results_query })

    data = parse_graphql_response(response.body)

    assert_equal 2, data['overallResults'].length

    overall_result = data['overallResults'].first
    assert_equal 'Jim Hopper', overall_result['player']['name']
    assert_equal '2019-07-11', overall_result['date']
    assert_equal 12, overall_result['overallRank']
    assert_equal 34, overall_result['previousRank']
    assert_equal 56, overall_result['points']
    assert_equal 40, overall_result['percentile']
    assert_equal(-64, overall_result['gap'])
    assert_equal({ 'ordinal' => 1, 'name' => 'E. Merckx', 'points' => 123 }, overall_result['riders'].first)
  end

  test 'query overall results for a single player returns one result' do
    post('/graphql', params: { query: overall_results_query(player_id: players(:jim_hopper).id) })

    data = parse_graphql_response(response.body)

    assert_equal 1, data['overallResults'].length

    overall_result = data['overallResults'].first
    assert_equal 'Jim Hopper', overall_result['player']['name']
    assert_equal '2019-07-11', overall_result['date']
    assert_equal 12, overall_result['overallRank']
    assert_equal 34, overall_result['previousRank']
    assert_equal 56, overall_result['points']
    assert_equal 40, overall_result['percentile']
    assert_equal(-64, overall_result['gap'])
    assert_equal({ 'ordinal' => 1, 'name' => 'E. Merckx', 'points' => 123 }, overall_result['riders'].first)
  end

  test 'query for results for non-existant tour returns empty array' do
    post('/graphql', params: { query: overall_results_query(year: 1964) })

    data = parse_graphql_response(response.body)
    assert_equal [], data['overallResults']
  end

  private

  def parse_graphql_response(original_response)
    JSON.parse(original_response).delete('data')
  end

  def overall_results_query(year: 2019, player_id: nil)
    query = "year: #{year}"
    query += ", playerId: #{player_id}" if player_id.present?

    <<~GRAPHQL
      query {
        overallResults(#{query}) {
          player {
            name
          }
          date
          overallRank
          previousRank
          points
          percentile
          gap
          riders {
            ordinal
            name
            points
          }
        }
      }
    GRAPHQL
  end
end
