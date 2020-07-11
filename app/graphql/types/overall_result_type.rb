# frozen_string_literal: true

module Types
  class OverallResultType < Types::BaseObject
    field :id, ID, null: false
    field :player, Types::PlayerType, null: false
    field :tour, Types::TourType, null: false
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :overall_rank, Integer, null: false
    field :previous_rank, Integer, null: true
    field :points, Integer, null: false
    field :percentile, Integer, null: true
    field :gap, Integer, null: false
    field :riders, [Types::PlayerRiderPointsType], null: false

    def riders
      object.player_rider_points
    end
  end
end
