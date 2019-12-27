# frozen_string_literal: true

class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.integer :year
      t.index :year
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
