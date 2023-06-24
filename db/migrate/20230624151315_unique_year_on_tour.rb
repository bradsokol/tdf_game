class UniqueYearOnTour < ActiveRecord::Migration[7.0]
  def change
    add_index :tours, :year, unique: true
  end
end
