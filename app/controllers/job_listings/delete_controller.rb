# frozen_string_literal: true

module JobListings
  class DeleteController < ApplicationController
    include HasJobListing

    def call
      job_listing.destroy
      redirect_to root_path, status: 302
      # render IndexComponent.new
    end
  end
end
