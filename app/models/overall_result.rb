# frozen_string_literal: true

class OverallResult < ApplicationRecord
  belongs_to :player
  belongs_to :tour

  validates :overall_rank,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :previous_rank,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :points,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :gap,
            presence: true,
            numericality: { only_integer: true }
  validate :one_result_per_tour_and_player

  private

  def one_result_per_tour_and_player
    return unless new_record?
    return unless player && tour
    return unless OverallResult.default_scoped.exists?(player_id: player.id, tour_id: tour.id)

    errors.add(:base, 'One overall result per player and tour')
  end
end
