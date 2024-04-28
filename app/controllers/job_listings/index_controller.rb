# frozen_string_literal: true

module JobListings
  class IndexController < ApplicationController
    def call
      render IndexComponent.new(user: current_user, event_types: event_types)
    end

    private

    def event_types
      params.fetch(:event_types, "").split(",").map(&:strip).map(&:downcase)
    end
  end
end
