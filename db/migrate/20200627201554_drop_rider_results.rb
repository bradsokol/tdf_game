class DropRiderResults < ActiveRecord::Migration[6.0]
  def up
    drop_table :rider_results
  end
end
