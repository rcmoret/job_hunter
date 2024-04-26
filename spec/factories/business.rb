# frozen_string_literal: true

FactoryBot.define do
  factory :business do
    association :user
    name { Faker::Name.unique.name }
  end
end
