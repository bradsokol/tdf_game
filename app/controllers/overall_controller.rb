# frozen_string_literal: true

class OverallController < ApplicationController
  def default
    redirect_to_default_year
  end

  def index
    tour = Tour.find_by(year: @year)

    if tour&.overall_results.blank?
      redirect_to_default_year
    else
      @overall_results = tour.overall_results.order(points: :desc)
      @date = @overall_results.first.date
    end
  end

  private

  def most_recent_tour_with_results
    Tour.all.order(year: :desc).select { |tour| tour.overall_results.present? }.first
  end

  def redirect_to_default_year
    redirect_to action: 'index', year: most_recent_tour_with_results.year
  end
end
