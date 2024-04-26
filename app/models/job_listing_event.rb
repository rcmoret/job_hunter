# frozen_string_literal: true

class JobListingEvent < ApplicationRecord
  belongs_to :job_listing
  belongs_to :job_listing_summary_view, foreign_key: :job_listing_id, required: false
  belongs_to :job_listing_event_type

  alias_attribute :event_type, :job_listing_event_type
  alias_attribute :event_type_id, :job_listing_event_type_id

  scope :belonging_to, lambda { |user|
    joins(:job_listing).merge(JobListing.belonging_to(user))
  }
  scope :with_event_types, lambda { |*descriptions|
    joins(:job_listing_event_type).merge(JobListingEventType.where(description: descriptions))
  }

  after_commit :publish_event!

  delegate :description, to: :event_type

  def <=>(other)
    event_time <=> other.event_time
  end

  private

  def publish_event!
    ActiveSupport::Notifications.instrument(
      "job_listing_event_created.#{description}",
      job_listing_id: job_listing_id
    )
  end
end
