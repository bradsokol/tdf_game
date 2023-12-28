# typed: true
# frozen_string_literal: true

class Stage < ApplicationRecord
  extend T::Sig

  belongs_to :tour

  has_many :stage_results, dependent: :restrict_with_exception

  enum stage_type: {
    flat: 'flat',
    itt: 'itt',
    mountain: 'mountain',
    prolog: 'prolog',
    rest: 'rest',
    rolling: 'rolling',
    ttt: 'ttt',
  }

  validates :number,
            inclusion: 1..21,
            numericality: { only_integer: true, allow_nil: true },
            uniqueness: { scope: :tour }
  validates :date, presence: true
  validates :start_town, presence: true
  validates :finish_town, presence: true
  validates :distance, presence: true, numericality: { only_integer: true }
  validates :stage_type, presence: true
  validates :game_stage, inclusion: { in: [true, false] }

  scope :game_stages, -> { where(game_stage: true).order(:date) }
  scope :need_results, -> { game_stages.where(results_downloaded_at: nil) }
end
