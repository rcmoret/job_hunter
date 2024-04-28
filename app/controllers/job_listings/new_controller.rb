# frozen_string_literal: true

module JobListings
  class NewController < ApplicationController
    def call
      render NewListingForm.new(
        current_user,
        form_object: JobListingForm.new(current_user: current_user)
      )
    end
  end
end
