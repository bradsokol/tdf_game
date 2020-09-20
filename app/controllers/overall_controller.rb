# frozen_string_literal: true

class OverallController < ApplicationController
  def default
    redirect_to_default_year
  end

  def index
    @tour = Tour.find_by(year: @year)

    if @tour.nil?
      redirect_to_default_year
    elsif @tour.overall_results.present?
      overall_results = @tour.overall_results.order(points: :desc)
      @date = overall_results.first.date

      @podium, next_index, next_ordinal = add_ordinals(overall_results, index: 0, ordinal: 1, places: 3)

      @wannabees, next_index, next_ordinal = add_ordinals(overall_results, index: next_index, ordinal: next_ordinal, places: 5)

      @peleton, = add_ordinals(overall_results, index: next_index, ordinal: next_ordinal, places: overall_results.length - @podium.length - @wannabees.length)
    end
  end

  private

  def add_ordinals(results, index:, ordinal:, places:)
    place = ordinal
    last_points = -1
    partition = results[index..].select do |result|
      if place > (ordinal + places - 1)
        false
      else
        if result.points != last_points

          last_points = result.points
          result.ordinal = place
        end
        place += 1
        true
      end
    end

    [partition, (partition.length + index), place]
  end

  def redirect_to_default_year
    redirect_to action: 'index', year: Tour.all.order(:year).last.year
  end
end
