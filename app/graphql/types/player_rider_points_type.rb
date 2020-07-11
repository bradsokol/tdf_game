# frozen_string_literal: true

module Types
  class PlayerRiderPointsType < Types::BaseObject
    field :id, ID, null: false
    field :ordinal, Integer, null: false
    field :points, Integer, null: false
    field :name, String, null: false

    def name
      Rider.find(object.rider_id).name
    end
  end
end
