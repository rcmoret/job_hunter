# frozen_string_literal: true

class CreateJobListingEventTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :job_listing_event_types do |t|
      t.string :event_type, null: false, limit: 100, index: true

      t.timestamps
    end
  end
end
