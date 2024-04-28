# frozen_string_literal: true

module JobListings
  class IndexComponent < ViewComponent::Base
    erb_template <<-ERB
      <h1>Active Listings</h1>
      <p>
        Showing <%= pluralize(show_count, "listing") %>
      </p>
      <hr />
      <p>
        <%= link_to "+ Add New Job Listing", new_job_listing_path %>
      </p>
      <hr />
      <%= render JobListings::ListingSummaryComponent.with_collection(job_listings) %>
    ERB

    def initialize(user:, event_types: [])
      @user = user
      @event_types = event_types
    end

    def job_listings
      base_scope.then do |scope|
        scope = if event_types.any?
                  scope.with_event_types(event_types)
                else
                  scope.active
                end
        scope.by_most_recent_event
      end
    end

    def show_count
      job_listings.count
    end

    private

    attr_reader :user, :event_types

    def base_scope
      JobListingSummaryView
        .belonging_to(user)
    end
  end
end
