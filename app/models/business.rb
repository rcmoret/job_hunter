# frozen_string_literal: true

class Business < ApplicationRecord
  has_many :job_listings
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
