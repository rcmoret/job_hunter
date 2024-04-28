# frozen_string_literal: true

class CreateJobListingSummaryView < ActiveRecord::Migration[7.0]
  VIEW_NAME = "job_listing_summary_view"
  UP_QUERY = <<-SQL.freeze
    CREATE VIEW #{VIEW_NAME} AS
      SELECT jl.*, b.name as business_name, max(ev.event_time) as event_time
      FROM job_listings jl
      JOIN job_listing_events ev on ev.job_listing_id = jl.id
      JOIN businesses b on b.id = jl.business_id
      GROUP BY jl.id
  SQL

  def up
    ApplicationRecord.connection.exec_query(UP_QUERY)
  end

  def down
    ApplicationRecord.connection.exec_query("DROP VIEW IF EXISTS #{VIEW_NAME}")
  end
end
