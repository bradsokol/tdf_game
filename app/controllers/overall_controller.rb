# frozen_string_literal: true

class OverallController < ApplicationController
  def index
    year = params[:year].to_i
    tour = Tour.find_by(year: year)

    if tour&.overall_results.blank?
      year = Tour.all.order(:year).first.year
      redirect_to action: 'index', year: year
    else
      @overall_results = tour.overall_results.order(points: :desc)
      @date = @overall_results.first.date
    end
  end
end
