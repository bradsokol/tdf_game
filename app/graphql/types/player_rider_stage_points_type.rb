# frozen_string_literal: true

module Types
  class PlayerRiderStagePointsType < Types::BaseObject
    field :id, ID, null: false
    field :points, Integer, null: true
    field :name, String, null: false

    def name
      Rider.find(object.rider_id).name
    end
  end
end
