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

  test '#ordinal is required' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(ordinal: nil))

    refute_predicate player_rider_points, :valid?
  end

  test '#ordinal must be numeric' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(ordinal: 'not a number'))

    refute_predicate player_rider_points, :valid?
  end

  test '#ordinal must be an integer' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(ordinal: 3.1415))

    refute_predicate player_rider_points, :valid?
  end

  test '#ordinal must be at least 1' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(ordinal: 0))

    refute_predicate player_rider_points, :valid?
  end

  test '#ordinal must be no more than 15' do
    player_rider_points = PlayerRiderPoints.new(player_rider_points_input(ordinal: 16))

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
      ordinal: 2,
      points: 12,
    }.merge(input)
  end
end
