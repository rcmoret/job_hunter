# frozen_string_literal: true

require "rails_helper"

RSpec.describe JobListingEvent do
  subject do
    event.save
  end

  let(:job_listing) { create(:job_listing) }
  let(:event) do
    JobListingEvent.new(
      job_listing: job_listing,
      event_type: JobListingEventType.for(:deactivated),
      event_time: Time.current
    )
  end

  it "deactivates the listing" do
    travel_to(Time.current.beginning_of_minute) do
      expect { subject }
        .to change { job_listing.reload.deactivated_at }
        .from(nil)
        .to(Time.current)
    end
  end
end
