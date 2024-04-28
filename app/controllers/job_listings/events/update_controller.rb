# frozen_string_literal: true

module JobListings
  module Events
    class UpdateController < ApplicationController
      include HasJobListing
      include HasJobListingEventParams

      def call
        event.update(event_params)
        redirect_to job_listing_show_path(job_listing)
      end

      private

      def event
        JobListingEvent.belonging_to(current_user).find(params[:id])
      end
    end
  end
end
