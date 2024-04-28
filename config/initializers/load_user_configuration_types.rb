# frozen_string_literal: true

Rails.configuration.after_initialize do
  UserConfigurationOption::MAPPING.each do |config_type|
    UserConfigurationOption.find_or_initialize_by(description: config_type["description"]).tap do |config_option|
      config_option.update(default_value: config_type["default"])
    end
  end
end
