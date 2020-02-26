# frozen_string_literal: true

require 'test_helper'

class StageResultTest < ActiveSupport::TestCase
  test '.new creates stage result' do
    stage_result = StageResult.new(stage_result_input)

    assert_predicate stage_result, :valid?
  end

  test '#overall_rank is required' do
    stage_result = StageResult.new(stage_result_input(overall_rank: nil))

    refute_predicate stage_result, :valid?
  end

  test '#overall_rank must be an integer' do
    stage_result = StageResult.new(stage_result_input(overall_rank: 1.23))

    refute_predicate stage_result, :valid?
  end

  test '#overall_rank must be at least 1' do
    stage_result = StageResult.new(stage_result_input(overall_rank: 0))

    refute_predicate stage_result, :valid?

    stage_result = StageResult.new(stage_result_input(overall_rank: 1))

    assert_predicate stage_result, :valid?
  end

  test '#points is required' do
    stage_result = StageResult.new(stage_result_input(points: nil))

    refute_predicate stage_result, :valid?
  end

  test '#points must be an integer' do
    stage_result = StageResult.new(stage_result_input(points: 1.23))

    refute_predicate stage_result, :valid?
  end

  test '#points must be at least 0' do
    stage_result = StageResult.new(stage_result_input(points: -1))

    refute_predicate stage_result, :valid?

    stage_result = StageResult.new(stage_result_input(points: 0))

    assert_predicate stage_result, :valid?
  end

  test 'must be unique per player and stage' do
    stage_result = StageResult.new(stage_result_input(stage: stages(:tdf_2019_1)))

    refute_predicate stage_result, :valid?
  end

  private

  def stage_result_input(inputs = {})
    {
      player: players(:jim_hopper),
      stage: stages(:tdf_2019_2),
      overall_rank: 23,
      points: 12,
    }.merge(inputs)
  end
end
