# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :businesses
  has_many :job_listings, through: :businesses

  def configuration(option)
    UserConfigurationView.value_for(self, option)
  end
end
