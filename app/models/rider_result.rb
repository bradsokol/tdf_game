# frozen_string_literal: true

class RiderResult < ApplicationRecord
  belongs_to :player
  belongs_to :stage

  validates :points,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rider_name, presence: true
  validate :one_result_per_stage_player_and_rider

  private

  def one_result_per_stage_player_and_rider
    return unless new_record?
    return unless player && stage
    return unless RiderResult.default_scoped.exists?(player_id: player.id, rider_name: rider_name, stage_id: stage.id)

    errors.add(:base, 'One rider result per player, stage and rider')
  end
end
