# frozen_string_literal: true

class PlayerRiderPoints < ApplicationRecord
  belongs_to :tour
  belongs_to :player
  belongs_to :rider

  validates :ordinal,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 15 }
  validates :percentile,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :points,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
