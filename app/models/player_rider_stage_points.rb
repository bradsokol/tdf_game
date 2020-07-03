# frozen_string_literal: true

class PlayerRiderStagePoints < ApplicationRecord
  belongs_to :stage
  belongs_to :player
  belongs_to :rider

  validates :points,
            numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 0 }
end
