# frozen_string_literal: true

require 'test_helper'

class StageResultsQueryTest < ActionDispatch::IntegrationTest
  test 'query stage results return results' do
    post('/graphql', params: { query: stage_results_query })

    data = parse_graphql_response(response.body)

    assert_equal 1, data['stageResults'].length

    stage_result = data['stageResults'].first
    assert_equal 'Jim Hopper', stage_result['player']['name']
    assert_equal '2019-07-08', stage_result['stage']['date']
    assert_equal 12, stage_result['overallRank']
    assert_equal 34, stage_result['points']
  end

  test 'query for results for stage with none returns empty array' do
    post('/graphql', params: { query: stage_results_query(date: '2019-07-09') })

    data = parse_graphql_response(response.body)

    assert_equal 0, data['stageResults'].length
  end

  test 'query for results for non-existant stage returns empty array' do
    post('/graphql', params: { query: stage_results_query(date: '2119-07-09') })

    data = parse_graphql_response(response.body)

    assert_equal 0, data['stageResults'].length
  end

  private

  def parse_graphql_response(original_response)
    JSON.parse(original_response).delete('data')
  end

  def stage_results_query(date: '2019-07-08')
    <<~GRAPHQL
      query {
        stageResults(date: "#{date}") {
          player {
            name
          }
          stage {
            date
          }
          overallRank
          points
        }
      }
    GRAPHQL
  end
end
