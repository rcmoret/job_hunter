# frozen_string_literal: true

module JobListings
  class AddNewEventLink < ViewComponent::Base
    erb_template <<-ERB
      <p>
        <%= link_to "Add new event", new_job_listing_event_path(job_listing) %>
      </p>
    ERB

    def initialize(job_listing)
      @job_listing = job_listing
    end

    attr_reader :job_listing
  end
end
