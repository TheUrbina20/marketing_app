# frozen_string_literal: true

class CreateCampains < ActiveRecord::Migration[6.0]
  def change
    create_table :campains do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
