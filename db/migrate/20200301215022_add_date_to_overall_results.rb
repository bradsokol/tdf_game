class AddDateToOverallResults < ActiveRecord::Migration[6.0]
  def change
    add_column :overall_results, :date, :date
  end
end
