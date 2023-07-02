# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :registrations, dependent: :restrict_with_exception
  has_many :stage_results, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
