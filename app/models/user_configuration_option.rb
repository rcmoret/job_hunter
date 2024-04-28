# frozen_string_literal: true

class UserConfigurationOption < ApplicationRecord
  MAPPING = File
            .read("config/user_configs/options.yml")
            .then { |options| YAML.load(options).fetch("user_configuration_options") }
            .map(&:freeze)
            .freeze

  MAPPING.pluck("description").each do |config_description|
    define_method "#{config_description}_config?" do
      description == config_description
    end
  end

  validates :description, uniqueness: true, presence: true
  validates :default_value, presence: true
  validates :default_value,
            inclusion: { in: ActiveSupport::TimeZone::MAPPING.values },
            if: :timezone_config?
end
