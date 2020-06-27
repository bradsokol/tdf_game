# frozen_string_literal: true

require 'test_helper'

class PlayerRiderStagePointsTest < ActiveSupport::TestCase
  setup do
    @stage = stages(:tdf_2019_3)
    @player = players(:jim_hopper)
    @rider = riders(:e_merckx)
  end

  test '.new creates valid player rider points' do
    player_rider_points = PlayerRiderStagePoints.new(player_rider_stage_points_input)

    assert_predicate player_rider_points, :valid?
  end

  test '#points is required' do
    player_rider_points = PlayerRiderStagePoints.new(player_rider_stage_points_input(points: nil))

    refute_predicate player_rider_points, :valid?
  end

  test '#points must be numeric' do
    player_rider_points = PlayerRiderStagePoints.new(player_rider_stage_points_input(points: 'not a number'))

    refute_predicate player_rider_points, :valid?
  end

  test '#points must be an integer' do
    player_rider_points = PlayerRiderStagePoints.new(player_rider_stage_points_input(points: 3.1415))

    refute_predicate player_rider_points, :valid?
  end

  test '#points must be at least zero' do
    player_rider_points = PlayerRiderStagePoints.new(player_rider_stage_points_input(points: -1))

    refute_predicate player_rider_points, :valid?
  end

  private

  def player_rider_stage_points_input(input = {})
    {
      stage: @stage,
      player: @player,
      rider: @rider,
      points: 12,
    }.merge(input)
  end
end
