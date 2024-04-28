# frozen_string_literal: true

module HasJobListing
  extend ActiveSupport::Concern

  included do
    before_action :render_not_found, unless: proc { job_listing.present? }
  end

  def job_listing
    @job_listing ||=
      JobListing
      .belonging_to(current_user)
      .find_by(id: params.fetch(:job_listing_id))
  end

  def render_not_found
    flash[:error] = "Job Listing not found"
    redirect_to root_path
  end
end
