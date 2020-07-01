class AddRiderPercentiles < ActiveRecord::Migration[6.0]
  def change
    add_column :player_rider_points, :percentile, :integer, null: false
    add_column :player_rider_stage_points, :percentile, :integer, null: false
  end
end
