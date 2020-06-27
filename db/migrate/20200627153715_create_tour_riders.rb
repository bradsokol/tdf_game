class CreateTourRiders < ActiveRecord::Migration[6.0]
  def change
    create_join_table :riders, :tours do |t|
      t.index :tour_id

      t.timestamps
    end
  end
end
