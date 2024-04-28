# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserConfiguration do
  describe "#timezone_config?" do
    subject { build(:user_configuration, user_configuration_option: config_option) }

    context "when the config option is timestamp" do
      let(:config_option) { UserConfigurationOption.find_by(description: "timezone") }

      it "returns true" do
        expect(subject.timezone_config?).to be true
      end
    end

    context "when the config option is not timezone" do
      let(:config_option) { build(:user_configuration_option) }

      it "returns false" do
        expect(subject.timezone_config?).to be false
      end
    end
  end
end
