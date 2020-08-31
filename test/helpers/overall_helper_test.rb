# frozen_string_literal: true

require 'test_helper'

class OverallHelperTest < ActionView::TestCase
  setup do
    @result = OverallResult.first
  end

  test '#rank_change returns empty string when no previous rank' do
    @result.previous_rank = nil

    assert_equal '', rank_change(@result)
  end

  test '#rank_change returns rank change' do
    assert_equal 22, rank_change(@result)
  end
end
