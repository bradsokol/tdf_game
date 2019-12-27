# frozen_string_literal: true

module Types
  class TourType < Types::BaseObject
    field :id, ID, null: false
    field :year, Integer, null: false
    field :start_date, GraphQL::Types::ISO8601Date, null: false
    field :finish_date, GraphQL::Types::ISO8601Date, null: false
  end
end
