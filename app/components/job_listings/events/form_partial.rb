# frozen_string_literal: true

module JobListings
  module Events
    class FormPartial < ViewComponent::Base
      erb_template <<-ERB
        <div style="width: 100%;">
          <%= form_object.label "Event Type" %>
        </div>
        <%= form_object.input_field :event_type_id, **event_type_select_options %>
        <div style="width: 100%;">
          <p>Event Time</p>
        </div>
        <%= form_object.input_field :event_time %>
        <div style="width: 100%;">
          <%= form_object.label :information %>
        </div>
        <%= form_object.input_field :info, as: :text %>
        <div style="width: 100%;">
          <%= form_object.submit %>
        </div>
      ERB

      def initialize(form_object)
        @form_object = form_object
      end

      def event_type_select_options
        {
          collection: event_types,
          value_method: :first,
          label_method: :last,
        }
      end

      attr_reader :form_object

      private

      def event_types
        JobListingEventType.all.order(description: :asc).map do |event_type|
          [event_type.id, event_type.description.titleize]
        end
      end
    end
  end
end
