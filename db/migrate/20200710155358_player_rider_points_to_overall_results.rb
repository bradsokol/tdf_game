class PlayerRiderPointsToOverallResults < ActiveRecord::Migration[6.0]
  def change
    add_reference(:player_rider_points, :overall_result, null: false)

    remove_reference(:player_rider_points, :player)
    remove_reference(:player_rider_points, :tour)
  end
end
