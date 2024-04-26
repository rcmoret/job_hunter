# frozen_string_literal: true

require "rails_helper"

RSpec.describe Subscribers::BaseSubscriber do
  describe "#call" do
    subject do
      described_class.new(
        "event.description",
        30.seconds.ago.to_i,
        29.seconds.ago.to_i,
        SecureRandom.hex(4),
        { job_listing_id: job_listing_id }
      )
    end

    let(:job_listing_id) { rand(1..100).to_s }

    before { allow(JobListing).to receive(:find) }

    it "raises a not implemented error" do
      expect { subject.call }
        .to raise_error(NotImplementedError)
    end
  end
end
