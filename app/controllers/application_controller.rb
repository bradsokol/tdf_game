# typed: true
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  extend T::Sig

  before_action :find_tours_with_stages
  before_action :set_year

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

  sig { returns(Tour) }
  def most_recent_tour_with_results
    Tour.order(year: :desc).find { |tour| tour.overall_results.present? }
  end
end
