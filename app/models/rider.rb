# frozen_string_literal: true

class Rider < ApplicationRecord
  has_many :player_rider_points, dependent: :restrict_with_exception
  has_many :tours, through: :rider_tours

  validates :name, presence: true
end
