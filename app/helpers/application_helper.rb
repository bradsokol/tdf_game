# typed: false
# frozen_string_literal: true

module ApplicationHelper
  extend T::Sig

  sig { params(stage: Stage).returns(String) }
  def time_to_stage_results(stage)
    days = T.let(T.must(stage.date) - Time.zone.today, Rational).numerator
    if days.zero?
      hours = ((T.must(stage.date).to_time + 12.hours) - Time.zone.now) / 3600
      if hours <= 1
        'Results should be available shortly.'
      else
        "Results should be available in about #{pluralize(hours.to_i, 'hour')}."
      end
    else
      time_to_tour_results(stage.tour)
    end
  end

  sig { params(tour: Tour).returns(String) }
  def time_to_tour_results(tour)
    days = (T.must(tour.start_date) - Time.zone.today).numerator
    if days <= 0
      days_to_game_stage = (tour.game_stages.first.date - Time.zone.today).numerator
      if days_to_game_stage <= 0
        'Results should be available shortly.'
      else
        "The tour has started but the first game stage is in #{pluralize(days_to_game_stage, 'day')}."
      end
    elsif days.positive?
      days_in_words = distance_of_time_in_words(Time.zone.today, tour.start_date)
      "The tour starts on #{tour.start_date.strftime('%B %e')}. Check back in #{days_in_words}."
    else
      time_to_stage_results(tour.game_stages.first)
    end
  end
end
