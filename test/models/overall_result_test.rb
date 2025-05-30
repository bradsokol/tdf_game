# typed: true
# frozen_string_literal: true

require 'test_helper'

class OverallResultTest < ActiveSupport::TestCase
  extend T::Sig

  test '.new creates overall result' do
    overall_result = OverallResult.new(overall_result_input)

    assert_predicate overall_result, :valid?
  end

  test '#overall_rank is required' do
    overall_result = OverallResult.new(overall_result_input(overall_rank: nil))

    refute_predicate overall_result, :valid?
  end

  test '#overall_rank must be an integer' do
    overall_result = OverallResult.new(overall_result_input(overall_rank: 1.23))

    refute_predicate overall_result, :valid?
  end

  test '#overall_rank must be at least 1' do
    overall_result = OverallResult.new(overall_result_input(overall_rank: 0))

    refute_predicate overall_result, :valid?
  end

  test '#previous_rank must be an integer' do
    overall_result = OverallResult.new(overall_result_input(previous_rank: 1.23))

    refute_predicate overall_result, :valid?
  end

  test '#previous_rank must be at least 1' do
    overall_result = OverallResult.new(overall_result_input(previous_rank: 0))

    refute_predicate overall_result, :valid?
  end

  test '#points is required' do
    overall_result = OverallResult.new(overall_result_input(points: nil))

    refute_predicate overall_result, :valid?
  end

  test '#points must be an integer' do
    overall_result = OverallResult.new(overall_result_input(points: 1.23))

    refute_predicate overall_result, :valid?
  end

  test '#points must be at least 0' do
    overall_result = OverallResult.new(overall_result_input(points: -1))

    refute_predicate overall_result, :valid?
  end

  test '#gap is required' do
    overall_result = OverallResult.new(overall_result_input(gap: nil))

    refute_predicate overall_result, :valid?
  end

  test '#gap must be an integer' do
    overall_result = OverallResult.new(overall_result_input(gap: 1.23))

    refute_predicate overall_result, :valid?
  end

  test '#date is required' do
    overall_result = OverallResult.new(overall_result_input(date: nil))

    refute_predicate overall_result, :valid?
  end

  test '#percentile must be an integer' do
    overall_result = OverallResult.new(overall_result_input(percentile: 'foo'))

    refute_predicate overall_result, :valid?
  end

  test '#percentile must be at least 0' do
    overall_result = OverallResult.new(overall_result_input(percentile: -1))

    refute_predicate overall_result, :valid?
  end

  test '#percentile must be no more than 100' do
    overall_result = OverallResult.new(overall_result_input(percentile: 101))

    refute_predicate overall_result, :valid?
  end

  test 'must be unique per player and tour' do
    overall_result = OverallResult.new(overall_result_input(tour: tours(:tdf_2019)))

    refute_predicate overall_result, :valid?
  end

  test 'player tour uniqueness does not apply to persisted records' do
    overall_result = overall_results(:tdf_2019_jim_hopper)

    assert_predicate overall_result, :valid?
  end

  private

  sig { params(inputs: T::Hash[Symbol, T.untyped]).returns(T::Hash[Symbol, T.untyped]) }
  def overall_result_input(inputs = {})
    {
      player: players(:jim_hopper),
      tour: tours(:tdf_2020),
      overall_rank: 12,
      previous_rank: 23,
      points: 45,
      gap: -56,
      date: '2019-07-11',
      percentile: 50,
    }.merge(inputs)
  end
end
