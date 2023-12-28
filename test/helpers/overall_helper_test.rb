# typed: false
# frozen_string_literal: true

require 'test_helper'

class OverallHelperTest < ActionView::TestCase
  extend T::Sig

  setup do
    @result = OverallResult.first
    @tour = Tour.last
  end

  test '#rank_change returns empty string when no previous rank' do
    @result.previous_rank = nil

    assert_equal '', rank_change(@result)
  end

  test '#rank_change returns rank change' do
    assert_equal '22', rank_change(@result)
  end

  test '#subtitle returns date if not last stage' do
    date = @tour.stages.last.date - 1.day
    assert_equal 'Results up to July  9, 2019', subtitle(@tour, date)
  end

  test '#subtitle returns final results if last stage' do
    date = @tour.stages.last.date
    assert_equal 'Final results', subtitle(@tour, date)
  end
end
