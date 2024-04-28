# frozen_string_literal: true

class UserConfiguration < ApplicationRecord
  belongs_to :user
  belongs_to :user_configuration_option

  def self.config_option_methods
    UserConfigurationOption.all.map do |config_option|
      "#{config_option.description}_config?"
    end
  end

  delegate(*config_option_methods, to: :user_configuration_option)

  validates :value,
            inclusion: { in: ActiveSupport::TimeZone::MAPPING.values },
            if: :timezone_config?
  validates :value, presence: true
  validates :user_configuration_option_id, uniqueness: { scope: :user_id }
end
