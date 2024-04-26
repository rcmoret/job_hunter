# frozen_string_literal: true

FactoryBot.define do
  factory :job_listing_event do
    association :job_listing
    event_time { Time.current + rand(-10..10).minutes }
    event_type { JobListingEventType.for(JobListingEventType::VALID_EVENT_TYPES.sample) }
  end
end
