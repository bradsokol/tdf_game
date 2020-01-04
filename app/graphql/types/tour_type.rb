# frozen_string_literal: true

module Types
  class TourType < Types::BaseObject
    field :id, ID, null: false
    field :year, Integer, null: false
    field :start_date, GraphQL::Types::ISO8601Date, null: false
    field :finish_date, GraphQL::Types::ISO8601Date, null: false
    field :stages, [Types::StageType], null: false
    field :game_players, [Types::PlayerType], null: false

    def game_players
      player_ids = Registration.where(year: object.year).map(&:player_id)
      Player.where(id: player_ids)
    end
  end
end
