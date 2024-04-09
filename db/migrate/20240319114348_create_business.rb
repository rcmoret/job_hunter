# frozen_string_literal: true

class CreateBusiness < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name, null: false, limit: 200, index: { unique: true }
      t.string :information, null: true, limit: 1000

      t.timestamps
    end
  end
end
