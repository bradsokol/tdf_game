# frozen_string_literal: true

require 'test_helper'

class StageTest < ActiveSupport::TestCase
  test '.new creates stage' do
    stage = Stage.new(stage_input)

    assert_predicate stage, :valid?
  end

  test '#number must be between 1 and 21' do
    stage = Stage.new(stage_input(number: 0))

    refute_predicate stage, :valid?

    stage.number = 22

    refute_predicate stage, :valid?
  end

  test '#number must be an integer' do
    stage = Stage.new(stage_input(number: 'foo'))

    refute_predicate stage, :valid?
  end

  test '#number must be unqiue in a tour' do
    stage = Stage.new(stage_input(number: stages(:tdf_2019_1).number))

    refute_predicate stage, :valid?
  end

  test '#date is required' do
    stage = Stage.new(stage_input(date: nil))

    refute_predicate stage, :valid?
  end

  test '#start_town is required' do
    stage = Stage.new(stage_input(start_town: nil))

    refute_predicate stage, :valid?
  end

  test '#finish_town is required' do
    stage = Stage.new(stage_input(finish_town: nil))

    refute_predicate stage, :valid?
  end

  test '#distance is required' do
    stage = Stage.new(stage_input(distance: nil))

    refute_predicate stage, :valid?
  end

  test '#distance must be an integer' do
    stage = Stage.new(stage_input(distance: 123.4))

    refute_predicate stage, :valid?
  end

  test '#stage_type is required' do
    stage = Stage.new(stage_input(stage_type: nil))

    refute_predicate stage, :valid?
  end

  test '#stage_type must be a valid value' do
    exception = assert_raises(ArgumentError) do
      Stage.new(stage_input(stage_type: :no_drop_ride))
    end

    assert_equal "'no_drop_ride' is not a valid stage_type", exception.message
  end

  test '#game_stage is required' do
    stage = Stage.new(stage_input(game_stage: nil))

    refute_predicate stage, :valid?
  end

  test '#game_stage can be false' do
    stage = Stage.new(stage_input(game_stage: false))

    assert_predicate stage, :valid?
  end

  test 'game_stages returns only game stages' do
    assert_equal 3, Stage.game_stages.count
  end

  test 'need_results returns stages that need results' do
    assert_equal 2, Stage.need_results.count
  end

  private

  def stage_input(inputs = {})
    {
      tour: tours(:tdf_2019),
      number: 6,
      date: '2019-07-11',
      start_town: 'Mulhouse',
      finish_town: 'La Planche des Belles Filles',
      distance: 161,
      stage_type: 'mountain',
      game_stage: true,
      results_downloaded_at: nil,
    }.merge(inputs)
  end
end
