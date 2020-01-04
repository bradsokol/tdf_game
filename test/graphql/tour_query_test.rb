# frozen_string_literal: true

require 'test_helper'

class TourQueryTest < ActionDispatch::IntegrationTest
  test 'query tours with stages' do
    post('/graphql', params: { query: tours_query })

    data = parse_graphql_response(response.body)

    assert_equal 2, data['tours'].length
    assert_equal 2, data['tours'][0]['stages'].length
    assert_equal 0, data['tours'][1]['stages'].length
  end

  test 'query tours with game players' do
    post('/graphql', params: { query: tours_query })

    data = parse_graphql_response(response.body)

    game_players = data['tours'][0]['gamePlayers']
    assert_equal 2, game_players.length
    assert_equal ['Jim Hopper', 'Will Byers'], game_players.map { |player| player['name'] }.sort

    game_players = data['tours'][1]['gamePlayers']
    assert_equal 1, game_players.length
    assert_equal ['Jim Hopper'], game_players.map { |player| player['name'] }.sort
  end

  private

  def parse_graphql_response(original_response)
    JSON.parse(original_response).delete('data')
  end

  def tours_query
    <<~GRAPHQL
      query {
        tours {
          id
          year
          startDate
          finishDate
          gamePlayers {
            name
          }
          stages {
            id
            number
            date
            startTown
            startCountry
            finishTown
            finishCountry
            distance
            stageType
            gameStage
          }
        }
      }
    GRAPHQL
  end
end
