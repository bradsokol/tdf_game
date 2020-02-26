# frozen_string_literal: true

class StageResult < ApplicationRecord
  belongs_to :player
  belongs_to :stage

  validates :overall_rank,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :points,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
