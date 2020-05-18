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
  validates :percentile,
            allow_nil: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validate :one_result_per_stage_and_player

  private

  def one_result_per_stage_and_player
    return unless new_record?
    return unless player && stage
    return unless StageResult.default_scoped.exists?(player_id: player.id, stage_id: stage.id)

    errors.add(:base, 'One stage result per player and stage')
  end
end
