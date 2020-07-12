# frozen_string_literal: true

module Types
  class StageResultType < Types::BaseObject
    field :id, ID, null: false
    field :player, Types::PlayerType, null: false
    field :stage, Types::StageType, null: false
    field :overall_rank, Integer, null: false
    field :points, Integer, null: false
    field :percentile, Integer, null: true
    field :riders, [Types::PlayerRiderStagePointsType], null: false

    def riders
      object.player_rider_stage_points
    end
  end
end
