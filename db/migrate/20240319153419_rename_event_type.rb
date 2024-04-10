# frozen_string_literal: true

class RenameEventType < ActiveRecord::Migration[7.0]
  def change
    rename_column :job_listing_event_types, :event_type, :description
  end
end
