# frozen_string_literal: true

class Tour < ApplicationRecord
  validates :year, presence: true, numericality: { only_integer: true }, uniqueness: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
end
