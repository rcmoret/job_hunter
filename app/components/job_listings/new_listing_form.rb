# frozen_string_literal: true

module JobListings
  class NewListingForm < ViewComponent::Base
    def initialize(current_user, form_object:)
      @form_object = form_object
      @current_user = current_user
    end

    def businesses
      current_user.businesses.order(name: :asc)
    end

    def event_types
      JobListingEventType.all.order(description: :asc).map do |event_type|
        [event_type.id, event_type.description.titleize]
      end
    end

    attr_reader :form_object, :current_user
  end
end
