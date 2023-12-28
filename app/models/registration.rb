# typed: true
# frozen_string_literal: true

class Registration < ApplicationRecord
  extend T::Sig

  belongs_to :player

  validates :year, presence: true, numericality: { only_integer: true }
end
