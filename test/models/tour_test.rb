# typed: true
# frozen_string_literal: true

require 'test_helper'

class TourTest < ActiveSupport::TestCase
  extend T::Sig

  test '.new creates tour' do
    tour = Tour.new(tour_input)

    assert_predicate tour, :valid?
  end

  test '#year is required' do
    tour = Tour.new(tour_input(year: nil))

    refute_predicate tour, :valid?
  end

  test '#year must be an integer' do
    tour = Tour.new(tour_input(year: 3.1415))

    refute_predicate tour, :valid?
  end

  test '#year must be unique' do
    tour = Tour.new(tour_input(year: 2019))

    refute_predicate tour, :valid?
  end

  test '#start_date is required' do
    tour = Tour.new(tour_input(start_date: nil))

    refute_predicate tour, :valid?
  end

  test '#finish_date is required' do
    tour = Tour.new(tour_input(finish_date: nil))

    refute_predicate tour, :valid?
  end

  test '.game_stages returns only game stages' do
    game_stages = tours(:tdf_2019).game_stages

    assert_equal 3, game_stages.count
  end

  private

  sig { params(inputs: T::Hash[Symbol, T.untyped]).returns(T::Hash[Symbol, T.untyped]) }
  def tour_input(inputs = {})
    {
      year: 2018,
      start_date: '2018-07-07',
      finish_date: '2018-07-29',
    }.merge(inputs)
  end
end
