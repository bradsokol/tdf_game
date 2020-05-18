class CreateRiderResultsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :rider_results do |t|
      t.references :player
      t.references :stage

      t.string :rider_name
      t.integer :points

      t.timestamps
    end

    change_table :stage_results do |t|
      t.integer :percentile
    end

    change_table :overall_results do |t|
      t.integer :percentile
    end
  end
end
