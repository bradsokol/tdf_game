class AddOverallResults < ActiveRecord::Migration[6.0]
  def change
    create_table :overall_results do |t|
      t.references :player
      t.references :tour

      t.integer :overall_rank
      t.integer :previous_rank
      t.integer :points
      t.integer :gap

      t.timestamps
    end
  end
end
