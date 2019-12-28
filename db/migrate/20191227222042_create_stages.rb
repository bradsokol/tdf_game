# frozen_string_literal: true

class CreateStages < ActiveRecord::Migration[6.0]
  def change
    create_table :stages do |t|
      t.references :tour

      t.integer :number
      t.date :date
      t.string :start_town
      t.string :start_country, default: 'France'
      t.string :finish_town
      t.string :finish_country, default: 'France'
      t.integer :distance
      t.string :stage_type
      t.boolean :game_stage
      t.datetime :results_downloaded_at

      t.timestamps
    end
  end
end
