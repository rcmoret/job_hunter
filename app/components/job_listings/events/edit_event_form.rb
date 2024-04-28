# frozen_string_literal: true

module JobListings
  module Events
    class EditEventForm < ViewComponent::Base
      erb_template <<-ERB
        <div style="border: 1px solid #888; margin-bottom: 1rem; padding: 0.5rem 0.8rem; border-radius: 1rem; background-color: #f2effc;">
          <p>Update Event</p>
          <%= simple_form_for event, url: url, method: :put, data: { turbo: false }  do |form_object| %>
            <%= render form_partial(form_object) %>
          <% end %>
        </div>
      ERB

      def initialize(event:)
        @event = event
      end

      def form_partial(form_object)
        FormPartial.new(form_object)
      end

      def url
        update_job_listing_event_path(event.job_listing, event)
      end

      attr_reader :event
    end
  end
end
