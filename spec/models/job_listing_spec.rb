require "rails_helper"

RSpec.describe JobListing do
  describe "#deactivate!" do
    subject { job_listing.deactivate! }
    let(:job_listing) { create(:job_listing) }

    it "updates the deactivated_at timestamp" do
      travel_to(Time.current.beginning_of_minute) do
        expect { subject }
          .to change { job_listing.reload.deactivated_at }
          .from(nil)
          .to(Time.current)
      end
    end
  end
end
