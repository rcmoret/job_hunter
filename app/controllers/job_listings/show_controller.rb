# frozen_string_literal: true

module JobListings
  class ShowController < ApplicationController
    include HasJobListing

    def call
      render JobListingComponent.new(job_listing, children: children)
    end

    private

    def children
      [
        DeleteJobListingLink.new(job_listing),
        AddNewEventLink.new(job_listing),
        Shared::RootLink.instance,
      ]
    end
  end
end
