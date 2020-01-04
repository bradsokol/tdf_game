# frozen_string_literal: true

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test '.new creates player' do
    player = Player.new(name: 'Bob Newman')

    assert_predicate player, :valid?
  end

  test '#name is required' do
    player = Player.new

    refute_predicate player, :valid?
  end

  test '#name must be unique' do
    player = Player.new(name: players(:jim_hopper).name)

    refute_predicate player, :valid?
  end
end
