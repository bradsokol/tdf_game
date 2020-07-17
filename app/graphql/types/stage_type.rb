# frozen_string_literal: true

module Types
  class StageType < Types::BaseObject
    field :id, ID, null: false
    field :number, Integer, null: true
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :start_town, String, null: false
    field :start_country, String, null: false
    field :finish_town, String, null: false
    field :finish_country, String, null: false
    field :distance, Integer, null: false
    field :stage_type, Types::StageTypeEnum, null: false
    field :game_stage, Boolean, null: false
    field :stage_results, [Types::StageResultType], null: false do
      argument :player_id, Integer, required: true
    end

    def stage_results(player_id:)
      object.stage_results.where(player_id: player_id)
    end
  end
end
