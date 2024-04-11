# frozen_string_literal: true

class JobListingForm
  include ActiveModel::Model

  attr_accessor :business_name,
                :business_information,
                :description,
                :point_of_contact,
                :url,
                :business_id,
                :current_user

  validate :business_found!

  def save
    job_listing.save!
  end

  def business
    @business ||=
      current_user.businesses.find_by(id: business_id) ||
      current_user.businesses.build(name: business_name, information: business_information)
  end

  private

  def job_listing
    @job_listing ||= business.job_listings.build(
      description: description,
      point_of_contact: point_of_contact,
      url: url
    )
  end

  def business_found!
    return if business.present?
    return if business_id.blank?

    errors.add(:business_id, "couldn't find business by id: #{business_id}")
  end
end
