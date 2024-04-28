# frozen_string_literal: true

FactoryBot.define do
  factory :user_configuration_option do
    description { Faker::Lorem.words(number: rand(1..4)).map(&:downcase).join("_") }
    default_value { rand(1..100).to_s }
  end
end
