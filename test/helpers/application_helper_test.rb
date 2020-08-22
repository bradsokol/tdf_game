# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  setup do
    @tour = tours(:tdf_2019)
    @stage = @tour.game_stages.first
  end

  test 'time_to_stage_results returns text when stage results will be in a few hours' do
    travel_to(@stage.date + 10.hours) do
      assert_equal 'Results should be available in about 2 hours.', time_to_stage_results(@stage)
    end
  end

  test 'time_to_stage_results returns text when stage results will be in less than an hour' do
    travel_to(@stage.date + 12.hours) do
      assert_equal 'Results should be available shortly.', time_to_stage_results(@stage)
    end
  end

  test 'time_to_stage_results returns text when stage results will be in more than one day' do
    travel_to(@stage.date - 1.day) do
      assert_equal 'The tour has started but the first game stage is in 1 day.', time_to_stage_results(@stage)
    end
  end

  test 'time_to_tour_results returns string when tour starts in the future' do
    @tour.start_date = Date.today + 7.days

    expected_string = "The tour starts on #{@tour.start_date.strftime('%B %e')}. Check back in 7 days."
    assert_equal expected_string, time_to_tour_results(@tour)
  end

  test 'time_to_tour_results returns string when tour starts today' do
    travel_to(@stage.date + 12.hours) do
      assert_equal 'Results should be available shortly.', time_to_tour_results(@tour)
    end
  end
end
