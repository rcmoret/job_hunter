# frozen_string_literal: true

module JobListings
  class JobListingEditEventComponent < ViewComponent::Base
    erb_template File.read(Rails.root.join("app", "components", "job_listings", "job_listing_component.html.erb"))

    def initialize(job_listing, event_id:, children: [])
      @job_listing = job_listing
      @event_id = event_id
      @children = [edit_event_component] + children
    end

    def events_component
      JobListings::EventComponent.with_collection(job_listing.events.sort)
    end

    def edit_event_component
      Events::EditEventForm.new(event: event)
    end

    attr_reader :job_listing, :children, :event_id

    private

    def event
      job_listing.events.find(event_id)
    end
  end
end
