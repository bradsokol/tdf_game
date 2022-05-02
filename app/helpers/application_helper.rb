# frozen_string_literal: true

module ApplicationHelper
  def time_to_stage_results(stage)
    days = (stage.date - Date.today).numerator
    if days.zero?
      hours = ((stage.date.to_time + 12.hours) - Time.now) / 3600
      if hours <= 1
        'Results should be available shortly.'
      else
        "Results should be available in about #{pluralize(hours.to_i, 'hour')}."
      end
    else
      time_to_tour_results(stage.tour)
    end
  end

  def time_to_tour_results(tour)
    days = (tour.start_date - Date.today).numerator
    if days <= 0
      days_to_game_stage = (tour.game_stages.first.date - Date.today).numerator
      if days_to_game_stage <= 0
        'Results should be available shortly.'
      else
        "The tour has started but the first game stage is in #{pluralize(days_to_game_stage, 'day')}."
      end
    elsif days.positive?
      days_in_words = distance_of_time_in_words(Date.today, tour.start_date)
      "The tour starts on #{tour.start_date.strftime('%B %e')}. Check back in #{days_in_words}."
    else
      time_to_stage_results(tour.game_stages.first)
    end
  end
end
