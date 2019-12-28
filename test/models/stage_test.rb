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

  private

  def stage_input(inputs = {})
    {
      tour: tours(:tdf_2019),
      number: 3,
      date: '2019-07-08',
      start_town: 'Binche',
      start_country: 'Belgium',
      finish_town: 'Épernay',
      finish_country: 'France',
      distance: 215,
      stage_type: :rolling,
      game_stage: true,
      results_downloaded_at: nil,
    }.merge(inputs)
  end
end
