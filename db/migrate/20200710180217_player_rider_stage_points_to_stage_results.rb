class PlayerRiderStagePointsToStageResults < ActiveRecord::Migration[6.0]
  def change
    add_reference(:player_rider_stage_points, :stage_result, null: false)

    remove_reference(:player_rider_stage_points, :player)
    remove_reference(:player_rider_stage_points, :stage)
  end
end
