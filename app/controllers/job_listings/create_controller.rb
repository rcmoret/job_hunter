# frozen_string_literal: true

module JobListings
  class CreateController < ApplicationController
    def call
      if form_object.save
        redirect_to new_job_listing_event_path(form_object)
      else
        render NewListingForm.new(current_user, form_object: form_object)
      end
    end

    private

    def form_object
      @form_object ||= JobListingForm.new(
        current_user: current_user,
        description: job_listing_params[:description],
        point_of_contact: job_listing_params[:point_of_contact],
        url: job_listing_params[:url],
        business_id: business&.id,
        business_name: job_listing_params[:business_name],
        business_information: job_listing_params[:business_information]
      )
    end

    def business
      @business ||=
        current_user.businesses.find_by(id: job_listing_params[:business_id])
    end

    def job_listing_params
      params
        .require(:job_listing_form)
        .permit(
          :business_id,
          :business_name,
          :business_information,
          :description,
          :point_of_contact,
          :url
        )
    end
  end
end
