# frozen_string_literal: true

require "rails_helper"

RSpec.describe JobListingEvent do
  describe "#<=>" do
    subject { event <=> other_event }

    context "when the other event's event time is after self's event time" do
      let(:event) { build(:job_listing_event, event_time: 5.minutes.ago) }
      let(:other_event) { build(:job_listing_event, event_time: Time.current) }

      it "returns -1" do
        expect(subject).to be(-1)
      end
    end

    context "when the other event's event time is prior to self's event time" do
      let(:event) { build(:job_listing_event, event_time: Time.current) }
      let(:other_event) { build(:job_listing_event, event_time: 5.minutes.ago) }

      it "returns 1" do
        expect(subject).to be(1)
      end
    end

    context "when they are equal" do
      let(:event) { build(:job_listing_event, event_time: 5.minutes.ago) }
      let(:other_event) { build(:job_listing_event, event_time: 5.minutes.ago) }

      it "returns 0" do
        freeze_time do
          expect(subject).to be_zero
        end
      end
    end
  end

  describe "publishing a deactivation event" do
    subject { event.save }

    let!(:job_listing) { create(:job_listing) }
    let(:event) do
      JobListingEvent.new(
        job_listing: job_listing,
        event_type: event_type,
        event_time: Time.current
      )
    end

    context "when the event type is deactivated" do
      let(:event_type) { JobListingEventType.for(:deactivated) }

      it "deactivates the listing" do
        travel_to(Time.current.beginning_of_minute) do
          expect { subject }
            .to change { job_listing.reload.deactivated_at }
            .from(nil)
            .to(Time.current)
        end
      end
    end

    context "when the event type is application_declined" do
      let(:event_type) { JobListingEventType.for(:application_declined) }

      it "deactivates the listing" do
        travel_to(Time.current.beginning_of_minute) do
          expect { subject }
            .to change { job_listing.reload.deactivated_at }
            .from(nil)
            .to(Time.current)
        end
      end
    end
  end
end
