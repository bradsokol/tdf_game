# frozen_string_literal: true

require 'test_helper'

class OverallResultsQueryTest < ActionDispatch::IntegrationTest
  test 'query overall results return results' do
    post('/graphql', params: { query: overall_results_query })

    data = parse_graphql_response(response.body)

    assert_equal 1, data['overallResults'].length

    overall_result = data['overallResults'].first
    assert_equal 'Jim Hopper', overall_result['player']['name']
    assert_equal '2019-07-11', overall_result['date']
    assert_equal 12, overall_result['overallRank']
    assert_equal 34, overall_result['previousRank']
    assert_equal 56, overall_result['points']
    assert_equal(-64, overall_result['gap'])
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

  def overall_results_query(year: 2019)
    <<~GRAPHQL
      query {
        overallResults(year: #{year}) {
          player {
            name
          }
          date
          overallRank
          previousRank
          points
          gap
        }
      }
    GRAPHQL
  end
end
