class StageResults < ActiveRecord::Migration[6.0]
  def change
    create_table :stage_results do |t|
      t.references :player
      t.references :stage

      t.integer :points
      t.integer :overall_rank

      t.timestamps
    end
  end
end
