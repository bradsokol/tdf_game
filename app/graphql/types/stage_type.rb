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
    field :stage_type, StageTypeEnum, null: false
    field :game_stage, Boolean, null: false
  end
end
