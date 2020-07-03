class RemovePercentileFromRiderPoints < ActiveRecord::Migration[6.0]
  def change
    remove_column :player_rider_points, :percentile
    remove_column :player_rider_stage_points, :percentile
  end
end
