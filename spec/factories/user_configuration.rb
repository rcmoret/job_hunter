# frozen_string_literal: true

FactoryBot.define do
  factory :user_configuration do
    association :user
    association :user_configuration_option
    value { Faker::Lorem.words(number: rand(2..5)).join(" ") }
  end
end
