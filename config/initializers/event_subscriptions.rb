# frozen_string_literal: true

SUBSCRIPTIONS = {
  "job_listing_event_created.application_declined" => "Subscribers::DeactivationSubscriber",
  "job_listing_event_created.deactivated" => "Subscribers::DeactivationSubscriber",
}.freeze

Rails.configuration.after_initialize do
  SUBSCRIPTIONS.each_pair do |event, subscribers|
    ActiveSupport::Notifications.subscribe(event) do |*args|
      Array.wrap(subscribers).each do |subscriber|
        Object.const_get(subscriber).new(*args).call
      end
    end
  end
end
