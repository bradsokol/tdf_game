# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_year

  def set_year
    @year = params[:year]
  end

  def most_recent_tour_with_results
    Tour.all.order(year: :desc).select { |tour| tour.overall_results.present? }.first
  end
end
