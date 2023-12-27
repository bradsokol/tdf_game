# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :find_tours_with_stages
  before_action :set_year

  def find_tours_with_stages
    @tours = Tour
             .left_outer_joins(:stages)
             .where.not(stages: { id: nil })
             .order(year: :desc)
             .uniq
  end

  def set_year
    @year = params[:year]
  end

  def most_recent_tour_with_results
    Tour.order(year: :desc).find { |tour| tour.overall_results.present? }
  end
end
