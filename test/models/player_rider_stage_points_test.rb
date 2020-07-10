# frozen_string_literal: true

require 'test_helper'

class PlayerRiderStagePointsTest < ActiveSupport::TestCase
  setup do
    @rider = riders(:e_merckx)
    @stage_result = stage_results(:tdf_2019_3_jim_hopper)
  end

  test '.new creates valid player rider points' do
    player_rider_points = PlayerRiderStagePoints.new(player_rider_stage_points_input)

    assert_predicate player_rider_points, :valid?
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
      stage_result: @stage_result,
      rider: @rider,
      points: 12,
    }.merge(input)
  end
end
