# frozen_string_literal: true

require 'test_helper'

class RiderResultTest < ActiveSupport::TestCase
  test '.new creates rider result' do
    rider_result = RiderResult.new(rider_result_input)

    assert_predicate rider_result, :valid?
  end

  test '#points is required' do
    rider_result = RiderResult.new(rider_result_input(points: nil))

    refute_predicate rider_result, :valid?
  end

  test '#points must be an integer' do
    rider_result = RiderResult.new(rider_result_input(points: 1.23))

    refute_predicate rider_result, :valid?
  end

  test '#points must be at least 0' do
    rider_result = RiderResult.new(rider_result_input(points: -1))

    refute_predicate rider_result, :valid?

    rider_result = RiderResult.new(rider_result_input(points: 0))

    assert_predicate rider_result, :valid?
  end

  test 'must be unique per player, stage and rider' do
    rider_result = RiderResult.new(rider_result_input(rider_name: 'A. Schleck'))

    refute_predicate rider_result, :valid?
  end

  test 'rider player stage uniqueness does not apply to persisted records' do
    rider_result = rider_results(:tdf_2019_3_jim_hopper_a_schleck)

    assert_predicate rider_result, :valid?
  end

  private

  def rider_result_input(inputs = {})
    {
      player: players(:jim_hopper),
      stage: stages(:tdf_2019_3),
      rider_name: 'E. Merckx',
      points: 12,
    }.merge(inputs)
  end
end
