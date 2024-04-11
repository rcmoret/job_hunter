# frozen_string_literal: true

class JobListingEvent < ApplicationRecord
  belongs_to :job_listing
  belongs_to :job_listing_event_type

  alias_attribute :event_type, :job_listing_event_type
  alias_attribute :event_type_id, :job_listing_event_type_id

  def <=>(other)
    event_time <=> other.event_time
  end
end
