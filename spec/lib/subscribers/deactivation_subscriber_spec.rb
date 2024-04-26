# frozen_string_literal: true

require "rails_helper"

RSpec.describe Subscribers::DeactivationSubscriber do
  describe "#call" do
    subject do
      described_class.new(
        "event.description",
        30.seconds.ago.to_i,
        29.seconds.ago.to_i,
        SecureRandom.hex(4),
        { job_listing_id: job_listing.id }
      )
    end

    let(:job_listing) { create(:job_listing) }

    it "deactivates the job listing" do
      travel_to(Time.current.beginning_of_minute) do
        expect { subject.call }
          .to change { job_listing.reload.deactivated_at }
          .from(nil)
          .to(Time.current)
      end
    end
  end
end
