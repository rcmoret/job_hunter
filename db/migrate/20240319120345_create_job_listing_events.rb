# frozen_string_literal: true

class CreateJobListingEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :job_listing_events do |t|
      t.timestamp :event_time, null: false
      t.references :job_listing_event_type, foreign_key: true, null: false
      t.references :job_listing, foreign_key: true, null: false
      t.string :info, null: true, limit: 5000

      t.timestamps
    end
  end
end
