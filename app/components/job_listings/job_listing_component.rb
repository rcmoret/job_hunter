# frozen_string_literal: true

module JobListings
  class JobListingComponent < ViewComponent::Base
    def initialize(job_listing, children: [])
      @job_listing = job_listing
      @children = children
    end

    def events_component
      JobListings::EventComponent.with_collection(job_listing.events.sort)
    end

    attr_reader :job_listing, :children
  end
end
