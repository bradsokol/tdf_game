class UniqueNumberStage < ActiveRecord::Migration[7.0]
  def change
    add_index :stages, [:tour_id, :number], unique: true
  end
end
