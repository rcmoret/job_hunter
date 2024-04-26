# frozen_string_literal: true

class JobListing < ApplicationRecord
  belongs_to :business
  has_many :job_listing_events, dependent: :destroy

  alias_attribute :events, :job_listing_events

  accepts_nested_attributes_for :business
  accepts_nested_attributes_for :job_listing_events

  validates :description, :point_of_contact, presence: true

  scope :active, -> { where(deactivated_at: nil) }
  scope :belonging_to, ->(user) { joins(:business).merge(Business.belonging_to(user)) }

  delegate :user, to: :business

  def deactivate!(time: Time.current)
    update(deactivated_at: time)
  end
end
