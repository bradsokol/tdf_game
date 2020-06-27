# frozen_string_literal: true

require 'test_helper'

class RiderTest < ActiveSupport::TestCase
  test '.new creates a rider' do
    rider = Rider.new(rider_input)

    assert_predicate rider, :valid?
  end

  test '#name is required' do
    rider = Rider.new(rider_input(name: nil))

    refute_predicate rider, :valid?
  end

  private

  def rider_input(inputs = {})
    {
      name: 'E. Merckx'
    }.merge(inputs)
  end
end
