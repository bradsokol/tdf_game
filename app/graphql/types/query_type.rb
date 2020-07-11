# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :overall_results, [Types::OverallResultType], null: false do
      argument :year, Integer, required: true
      argument :player_id, Integer, required: false
    end

    def overall_results(year:, player_id: nil)
      tour = Tour.find_by(year: year)
      if player_id.present?
        tour.overall_results.where(player_id: player_id)
      else
        tour ? tour.overall_results : []
      end
    end

    field :stage_results, [Types::StageResultType], null: false do
      argument :date, GraphQL::Types::ISO8601Date, required: true
    end

    def stage_results(date:)
      stage = Stage.find_by(date: date)
      stage ? stage.stage_results : []
    end

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
