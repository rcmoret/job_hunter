# frozen_string_literal: true

module JobListings
  module Events
    class NewEventForm < ViewComponent::Base
      erb_template <<-ERB
        <div style="border: 1px solid #888; margin-bottom: 1rem; padding: 0.5rem 0.8rem; border-radius: 1rem; background-color: #f2effc;">
          <p>New Event</p>
          <%= simple_form_for event, url: job_listing_event_path, data: { turbo: false }  do |form_object| %>
            <%= render form_partial(form_object) %>
          <% end %>
        </div>
      ERB

      def initialize(user:, event: nil)
        @user = user
        @event = event || JobListingEvent.new(event_time: current_time.strftime("%F %T"))
      end

      def form_partial(form_object)
        FormPartial.new(form_object)
      end

      def current_time
        Time.current.in_time_zone(user.configuration(:timezone))
      end

      attr_reader :event, :user
    end
  end
end
