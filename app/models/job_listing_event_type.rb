# frozen_string_literal: true

class JobListingEventType < ApplicationRecord
  VALID_EVENT_TYPES = %i[
    application_submitted
    automated_response_received
    interview_conducted
    interview_scheduled
    follow_up_received
    follow_up_sent
  ].freeze

  validates :description, inclusion: { in: VALID_EVENT_TYPES }

  def self.for(description)
    find_or_create_by(description: description)
  end
end
