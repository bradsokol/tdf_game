# frozen_string_literal: true

class AddStageDateIndex < ActiveRecord::Migration[6.0]
  def change
    change_table :stages do |t|
      t.index :date
    end
  end
end
