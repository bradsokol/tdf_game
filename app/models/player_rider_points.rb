# frozen_string_literal: true

class PlayerRiderPoints < ApplicationRecord
  table_name = 'player_rider_points'

  belongs_to :tour
  belongs_to :player
  belongs_to :rider

  validates :points,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
