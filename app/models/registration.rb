# frozen_string_literal: true

class Registration < ApplicationRecord
  belongs_to :player

  validates :year, presence: true, numericality: { only_integer: true }
end
