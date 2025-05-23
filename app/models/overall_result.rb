# typed: true
# frozen_string_literal: true

class OverallResult < ApplicationRecord
  extend T::Sig

  attribute :ordinal

  belongs_to :player
  belongs_to :tour
  has_many :player_rider_points, class_name: 'PlayerRiderPoints', dependent: :restrict_with_exception

  validates :overall_rank,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :previous_rank,
            allow_nil: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :points,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :gap,
            presence: true,
            numericality: { only_integer: true }
  validates :date, presence: true
  validates :percentile,
            allow_nil: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validate :one_result_per_tour_and_player

  private

  sig { void }
  def one_result_per_tour_and_player
    return unless new_record?
    return unless player && tour
    return unless OverallResult.default_scoped.exists?(player_id: T.must(player).id, tour_id: T.must(tour).id)

    errors.add(:base, 'One overall result per player and tour')
  end
end
