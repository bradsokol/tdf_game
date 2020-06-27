# frozen_string_literal: true

class Rider < ApplicationRecord
  has_and_belongs_to_many :tours

  validates :name, presence: true
end
