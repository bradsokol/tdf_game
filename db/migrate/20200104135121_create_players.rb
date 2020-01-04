# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name

      t.timestamps
    end

    create_table :registrations do |t|
      t.references :player

      t.integer :year

      t.timestamps
    end
  end
end
