# typed: true
# frozen_string_literal: true

class OverallController < ApplicationController
  extend T::Sig

  def default
    redirect_to_default_year
  end

  sig { void }
  def index
    @tour = Tour.find_by(year: @year)

    if @tour.nil?
      redirect_to_default_year
    elsif @tour.overall_results.present?
      overall_results = @tour.overall_results.order(points: :desc).to_a
      @date = T.must(overall_results.first).date

      @podium, next_index, next_ordinal = add_ordinals(overall_results, index: 0, ordinal: 1, places: 3)

      @wannabees, next_index, next_ordinal = add_ordinals(
        overall_results,
        index: next_index,
        ordinal: next_ordinal,
        places: 5
      )

      @peleton, = add_ordinals(
        overall_results,
        index: next_index,
        ordinal: next_ordinal,
        places: overall_results.length - @podium.length - @wannabees.length
      )
    end
  end

  private

  sig do
    params(
      results: T::Array[OverallResult],
      index: Integer,
      ordinal: Integer,
      places: Integer
    )
      .returns([T::Array[OverallResult], Integer, Integer])
  end
  def add_ordinals(results, index:, ordinal:, places:)
    place = ordinal
    last_points = -1
    slice = results[index..] || []
    partition = slice.select do |result|
      if place > (ordinal + places - 1)
        if result.points == last_points
          # Last results in the group are tied
          place += 1
          true
        else
          false
        end
      else
        if result.points != last_points
          last_points = T.must(result.points)
          result.ordinal = place
        end
        place += 1
        true
      end
    end

    [partition, (partition.length + index), place]
  end

  def redirect_to_default_year
    redirect_to action: 'index', year: Tour.order(:year).last.year
  end
end
