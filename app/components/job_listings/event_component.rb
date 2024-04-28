# frozen_string_literal: true

module JobListings
  class EventComponent < ViewComponent::Base
    def initialize(event:, event_iteration:)
      @event = event
      @iteration_context = event_iteration
    end

    def event_type
      event.event_type.description.titleize
    end

    def event_time
      event
        .event_time
        .in_time_zone(current_user.configuration("timezone"))
        .strftime("%b. %-d, %Y %-l:%M %P %Z")
    end

    delegate :id, :info, to: :event

    attr_reader :event, :iteration_context

    private

    def current_user
      event.job_listing.user
    end
  end
end
