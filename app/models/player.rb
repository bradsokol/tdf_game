# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :registrations

  validates :name, presence: true, uniqueness: true
end
