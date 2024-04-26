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

  validate :valid_business!

  delegate :to_param, to: :job_listing

  def save
    return false unless valid?

    job_listing.save!
  end

  def business
    @business ||= find_or_build_business
  end

  def valid?
    return false if super == false
    return true if job_listing.valid?

    job_listing.errors.each do |error|
      errors.add(error.attribute, error.type)
    end

    false
  end

  private

  def job_listing
    @job_listing ||= business.job_listings.build(
      description: description,
      point_of_contact: point_of_contact,
      url: url
    )
  end

  def find_or_build_business
    if business_id.present?
      current_user.businesses.find_by(id: business_id)
    else
      current_user.businesses.build(name: business_name, information: business_information)
    end
  end

  def valid_business!
    if business_id.present? && business.nil?
      errors.add(:business_id, "couldn't find business by id: #{business_id}")
    elsif business.invalid?
      business.errors.each do |error|
        errors.add("business_#{error.attribute}", error.type)
      end
    end
  end
end
