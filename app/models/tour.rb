# frozen_string_literal: true

class Tour < ApplicationRecord
  has_many :overall_results
  has_many :stages, -> { order 'date' }
  has_and_belongs_to_many :riders

  validates :year, presence: true, numericality: { only_integer: true }, uniqueness: true
  validates :start_date, presence: true
  validates :finish_date, presence: true

  def game_stages
    stages.where(game_stage: true).order(:date)
  end
end
