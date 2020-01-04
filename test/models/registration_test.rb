# frozen_string_literal: true

require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  test '.new creates registration' do
    registration = Registration.new(registration_input)

    assert_predicate registration, :valid?
  end

  test 'registration must belong to a player' do
    registration = Registration.new(year: 2019)

    refute_predicate registration, :valid?
  end

  test '#year is required' do
    registration = Registration.new(registration_input(year: nil))

    refute_predicate registration, :valid?
  end

  test '#year must be an integer' do
    registration = Registration.new(registration_input(year: 3.1415))

    refute_predicate registration, :valid?
  end

  private

  def registration_input(inputs = {})
    {
      player: Player.new(name: 'Bob Newman'),
      year: 2019,
    }.merge(inputs)
  end
end
