class CreateRiderPointsTables < ActiveRecord::Migration[6.0]
  def change
    create_table :player_rider_points do |t|
      t.integer :points

      t.references :tour
      t.references :player
      t.references :rider

      t.timestamps
    end

    create_table :player_rider_stage_points do |t|
      t.integer :points

      t.references :stage
      t.references :player
      t.references :rider

      t.timestamps
    end
  end
end
