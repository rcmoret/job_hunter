# frozen_string_literal: true

class Business < ApplicationRecord
  has_many :job_listings

  validates :name, presence: true, uniqueness: true
end
