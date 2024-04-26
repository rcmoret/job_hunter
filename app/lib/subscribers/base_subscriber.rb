# frozen_string_literal: true

module Subscribers
  class BaseSubscriber
    def initialize(message, start, finish, uid, payload)
      @message = message
      @start = start
      @finish = finish
      @uid = uid
      @job_listing = JobListing.find(payload.fetch(:job_listing_id))
    end

    def call
      raise NotImplementedError
    end

    private

    # delegate :data, :user_id, to: :event

    attr_reader :message, :start, :finish, :uid, :job_listing
  end
end
