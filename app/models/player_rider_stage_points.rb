# frozen_string_literal: true

class PlayerRiderStagePoints < ApplicationRecord
  belongs_to :stage
  belongs_to :player
  belongs_to :rider

  validates :percentile,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :points,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
