# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :tours, [Types::TourType], null: false

    def tours
      Tour.all
    end
  end
end
