# frozen_string_literal: true

require 'test_helper'

class PlayerRiderPointsTest < ActiveSupport::TestCase
  setup do
    @tour = tours(:tdf_2019)
    @player = players(:jim_hopper)
    @rider = riders(:e_merckx)
  end

  test '.new creates valid player rider points' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input)

    assert_predicate player_rider_points, :valid?
  end

  test '#percentile is required' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(percentile: nil))

    refute_predicate player_rider_points, :valid?
  end

  test '#percentile must be numeric' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(percentile: 'not a number'))

    refute_predicate player_rider_points, :valid?
  end

  test '#percentile must be an integer' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(percentile: 3.1415))

    refute_predicate player_rider_points, :valid?
  end

  test '#percentile must be at least zero' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(percentile: -1))

    refute_predicate player_rider_points, :valid?
  end

  test '#percentile must be no more than 100' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(percentile: 101))

    refute_predicate player_rider_points, :valid?
  end

  test '#points is required' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(points: nil))

    refute_predicate player_rider_points, :valid?
  end

  test '#points must be numeric' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(points: 'not a number'))

    refute_predicate player_rider_points, :valid?
  end

  test '#points must be an integer' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(points: 3.1415))

    refute_predicate player_rider_points, :valid?
  end

  test '#points must be at least zero' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(points: -1))

    refute_predicate player_rider_points, :valid?
  end

  private

  def player_rider_points_input(input = {})
    {
      tour: @tour,
      player: @player,
      rider: @rider,
      percentile: 90,
      points: 12,
    }.merge(input)
  end
end
