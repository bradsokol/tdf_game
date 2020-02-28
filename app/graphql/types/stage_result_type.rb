# frozen_string_literal: true

module Types
  class StageResultType < Types::BaseObject
    field :id, ID, null: false
    field :player, Types::PlayerType, null: false
    field :stage, Types::StageType, null: false
    field :overall_rank, Integer, null: false
    field :points, Integer, null: false
  end
end
