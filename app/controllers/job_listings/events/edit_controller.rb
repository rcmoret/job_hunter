# frozen_string_literal: true

module JobListings
  module Events
    class EditController < ApplicationController
      include HasJobListing

      def call
        render JobListingEditEventComponent.new(
          job_listing,
          event_id: params[:id],
          children: children
        )
      end

      private

      def children
        [Shared::RootLink.instance]
      end
    end
  end
end
