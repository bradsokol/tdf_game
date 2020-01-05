# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :tours, [Types::TourType], null: false do
      argument :year, Integer, required: false
    end

    def tours(year: nil)
      if year
        Tour.where(year: year)
      else
        Tour.all
      end
    end
  end
end
