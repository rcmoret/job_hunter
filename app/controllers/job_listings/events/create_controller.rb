# frozen_string_literal: true

module JobListings
  module Events
    class CreateController < ApplicationController
      include HasJobListing
      include HasJobListingEventParams

      def call
        if event.save
          redirect_to job_listing_show_path(job_listing)
        else
          render JobListingComponent.new(
            job_listing,
            children: [NewEventForm.new(user: current_user, event: event), Shared::RootLink.instance]
          )
        end
      end

      private

      def event
        job_listing.events.build(event_params)
      end
    end
  end
end
