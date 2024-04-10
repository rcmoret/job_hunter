# frozen_string_literal: true

class CreateJobListings < ActiveRecord::Migration[7.0]
  def change
    create_table :job_listings do |t|
      t.references :business, foreign_key: true, null: false
      t.string :description, null: false, limit: 200
      t.string :point_of_contact, null: false, limit: 200
      t.string :url, null: true, limit: 500

      t.timestamps
    end
  end
end
