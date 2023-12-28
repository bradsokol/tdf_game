# typed: true
# frozen_string_literal: true

class PlayerRiderPoints < ApplicationRecord
  extend T::Sig

  belongs_to :overall_result
  belongs_to :rider

  validates :ordinal,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 15 }
  validates :points,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
