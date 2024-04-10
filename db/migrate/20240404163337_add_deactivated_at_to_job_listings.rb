# frozen_string_literal: true

class AddDeactivatedAtToJobListings < ActiveRecord::Migration[7.0]
  def change
    add_column :job_listings, :deactivated_at, :datetime, null: true
  end
end
