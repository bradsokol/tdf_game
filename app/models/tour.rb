# typed: true
# frozen_string_literal: true

class Tour < ApplicationRecord
  extend T::Sig

  has_many :overall_results, dependent: :restrict_with_exception
  has_many :stages, -> { order 'date' }, inverse_of: :tour, dependent: :restrict_with_exception
  # has_many :riders, through: :rider_tours
  has_and_belongs_to_many :riders

  validates :year, presence: true, numericality: { only_integer: true }, uniqueness: true
  validates :start_date, presence: true
  validates :finish_date, presence: true

  sig { returns(T::Array[Stage]) }
  def game_stages
    stages.where(game_stage: true).order(:date).to_a
  end
end
