# frozen_string_literal: true

FactoryBot.define do
  factory :job_listing do
    association :business
    description { Faker::Lorem.words(number: rand(2..4)).join(" ") }
    point_of_contact { [Faker::Name.name, Faker::Internet.email].join(": ") }
    url { Faker::Internet.url }

    trait :deactivated do
      deactivated_at { 5.minutes.ago }
    end
  end
end
