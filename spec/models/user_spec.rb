# frozen_string_literal: true

require "rails_helper"

RSpec.describe User do
  describe "timezone_configuration" do
    subject { user.configuration(:timezone) }

    let(:user) { create(:user) }

    context "when the option is timezone" do
      context "when a user specific config exists" do
        let(:timezone) { "America/Chicago" }
        let(:user_configuration_option) { UserConfigurationOption.find_by(description: "timezone") }

        before do
          create(:user_configuration,
                 user: user,
                 user_configuration_option: user_configuration_option,
                 value: timezone)
        end

        it "returns the configuration value" do
          expect(subject).to eq timezone
        end
      end

      context "when a user specific config does not exist" do
        it "returns the default option value" do
          expect(subject).to eq "America/New_York"
        end
      end
    end
  end
end
