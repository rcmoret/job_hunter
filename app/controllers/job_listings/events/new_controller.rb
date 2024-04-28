# frozen_string_literal: true

module JobListings
  module Events
    class NewController < ApplicationController
      include HasJobListing

      def call
        render JobListingComponent.new(job_listing, children: children)
      end

      private

      def children
        [
          NewEventForm.new(user: current_user),
          Shared::RootLink.instance,
        ]
      end
    end
  end
end
