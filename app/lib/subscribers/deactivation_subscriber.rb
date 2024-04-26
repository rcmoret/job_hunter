# frozen_string_literal: true

module Subscribers
  class DeactivationSubscriber < BaseSubscriber
    def call
      job_listing.deactivate!
    end
  end
end
