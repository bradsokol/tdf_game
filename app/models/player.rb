# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :registrations
  has_many :stage_results

  validates :name, presence: true, uniqueness: true
end
