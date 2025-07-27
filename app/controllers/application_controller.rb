# typed: true
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  extend T::Sig

  before_action :find_tours_with_stages
  before_action :set_year
  before_action :set_year_stages

  sig { void }
  def find_tours_with_stages
    @tours = Tour
             .left_outer_joins(:stages)
             .where.not(stages: { id: nil })
             .order(year: :desc)
             .uniq
  end

  sig { void }
  def set_year
    @year = params[:year]
  end

  sig { void }
  def set_year_stages
    @year_stages = Tour.order(:year).map do |tour|
      [
        tour.year,
        tour.stages
            .select { |stage| stage.game_stage? && stage.results_downloaded_at? }
            .max do |a, b|
              if a.number < b.number
                -1
              else
                (a.number > b.number ? 1 : 0)
              end
            end.number
      ]
    end.to_h
  end

  sig { returns(Tour) }
  def most_recent_tour_with_results
    Tour.order(year: :desc).find { |tour| tour.overall_results.present? }
  end
end
