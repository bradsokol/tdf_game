class AddPlayerRiderOrdinal < ActiveRecord::Migration[6.0]
  def change
    add_column :player_rider_points, :ordinal, :integer, null: false
  end
end
