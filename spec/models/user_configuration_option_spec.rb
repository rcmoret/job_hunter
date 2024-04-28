# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserConfigurationOption do
  describe "#timezone_config?" do
    subject { user_configuration_option.timezone_config? }

    context "when it is timezone option" do
      let(:user_configuration_option) do
        build(:user_configuration_option,
              description: :timezone,
              default_value: ActiveSupport::TimeZone::MAPPING.values.sample)
      end

      it "returns true" do
        expect(subject).to be true
      end
    end

    context "when it is theme option" do
      let(:user_configuration_option) do
        build(:user_configuration_option,
              description: :theme,
              default_value: %w[light dark].sample)
      end

      it "returns false" do
        expect(subject).to be false
      end
    end
  end
end
