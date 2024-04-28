# frozen_string_literal: true

class UserConfigurationView < ApplicationRecord
  self.table_name = :user_configuration_view

  scope :belonging_to, ->(user) { where(user_id: user.id).or(where(user_id: nil)) }

  def self.value_for(user, description)
    belonging_to(user).find_by(description: description).value
  end
end
