# frozen_string_literal: true

Rails.configuration.after_initialize do
  JobListingEventType::VALID_EVENT_TYPES.each do |description|
    JobListingEventType.for(description)
  end
end
