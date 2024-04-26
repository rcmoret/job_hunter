# frozen_string_literal: true

require "rails_helper"

RSpec.describe JobListingForm do
  describe "#save" do
    let(:user) { create(:user) }
    let(:business_name) { "Example, LLC" }

    context "when providing a business name" do
      subject do
        described_class.new(
          current_user: user,
          business_name: business_name,
          description: Faker::Lorem.words(number: rand(2..4)).join(" "),
          point_of_contact: Faker::Internet.email,
          business_id: nil,
          business_information: Faker::Lorem.words(number: rand(8..12)).join(" "),
          url: Faker::Internet.url
        )
      end

      context "when providing a business name that has not been used by the user" do
        before { create(:business, name: business_name) }

        it "returns true" do
          expect(subject.save).to be true
        end

        it "creates a new business" do
          expect { subject.save }
            .to change { Business.belonging_to(user).count }
            .by(+1)
            .and change { JobListing.belonging_to(user).count }
            .by(+1)
        end
      end

      context "when providing a business name that has been used by the user" do
        before { create(:business, name: business_name, user: user) }

        it "returns false and has errors" do
          expect(subject.save).to be false
          expect(subject.errors[:business_name]).to include "has already been taken"
        end

        it "does not create a new business" do
          expect { subject.save }
            .to change { Business.belonging_to(user).count }
            .by(0)
            .and change { JobListing.belonging_to(user).count }
            .by(0)
        end
      end
    end

    context "when providing a business id" do
      subject do
        described_class.new(
          current_user: user,
          business_name: nil,
          description: Faker::Lorem.words(number: rand(2..4)).join(" "),
          point_of_contact: Faker::Internet.email,
          business_id: business.id,
          business_information: "",
          url: Faker::Internet.url
        )
      end

      context "when the business is associated with the user" do
        let!(:business) { create(:business, name: business_name, user: user) }

        it "creates a job listing but not a business" do
          expect { subject.save }
            .to change { JobListing.belonging_to(user).count }
            .by(+1)
            .and change { Business.count }
            .by(0)
        end
      end

      context "when the business is associated with the user" do
        let!(:business) { create(:business, name: business_name) }

        it "returns false and has an error message" do
          expect(subject.save).to be false
          expect(subject.errors[:business_id]).to include "couldn't find business by id: #{business.id}"
        end

        it "does not create a job listing or business" do
          expect { subject.save }
            .to change { Business.belonging_to(user).count }
            .by(0)
            .and change { JobListing.belonging_to(user).count }
            .by(0)
        end
      end
    end

    context "when providing invalid job listing params" do
      subject do
        described_class.new(
          current_user: user,
          business_name: business_name,
          description: Faker::Lorem.words(number: rand(2..4)).join(" "),
          point_of_contact: "",
          business_id: nil,
          business_information: Faker::Lorem.words(number: rand(8..12)).join(" "),
          url: Faker::Internet.url
        )
      end

      it "returns false and has errors" do
        expect(subject.save).to be false
        expect(subject.errors[:point_of_contact]).to include "can't be blank"
      end

      it "does not create a job listing or business" do
        expect { subject.save }
          .to change { Business.belonging_to(user).count }
          .by(0)
          .and change { JobListing.belonging_to(user).count }
          .by(0)
      end
    end
  end
end
