# frozen_string_literal: true

class JobListingSummaryView < ApplicationRecord
  self.table_name = "job_listing_summary_view"
  self.primary_key = :id

  belongs_to :business
  has_many :job_listing_events, dependent: :destroy, foreign_key: :job_listing_id

  alias_attribute :events, :job_listing_events

  scope :active, -> { where(deactivated_at: nil) }
  scope :by_most_recent_event, -> { order(event_time: :desc) }
  scope :belonging_to, ->(user) { joins(:business).merge(Business.belonging_to(user)) }
  scope :with_event_types, lambda { |*descriptions|
    joins(:job_listing_events).merge(JobListingEvent.with_event_types(*descriptions))
  }

  def event_time
    Time.strptime(self[:event_time], "%F %T")
  end
end
