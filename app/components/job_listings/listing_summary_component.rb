# frozen_string_literal: true

module JobListings
  class ListingSummaryComponent < ViewComponent::Base
    erb_template <<-ERB
      <%= link_to job_listing_show_path(job_listing) do %>
        <p>
          (<%= iteration_counter %>)
          <span style="font-size: 1.5rem; text-decoration: underline;">
            <%= job_listing.business_name %>
          </span>
          - id: <%= job_listing.business_id %>
        </p>
      <% end %>
      <p>
        Listing created: <%= listing_created_at %>
      </p>
      <p>
        Most recent contact: <%= most_recent_contact %>
      </p>
      <% unless iteration_context.last? %>
        <hr />
      <% end %>
    ERB

    def initialize(listing_summary:, listing_summary_counter:, listing_summary_iteration:)
      @job_listing = listing_summary
      @iteration_context = listing_summary_iteration
      @iteration_counter = listing_summary_counter + 1
    end

    def most_recent_contact
      job_listing.event_time&.strftime("%a. %b. %-d, %Y %-l:%M %P")
    end

    def listing_created_at
      job_listing.created_at.strftime("%a. %b. %-d, %Y %-l:%M %P")
    end

    attr_reader :job_listing, :iteration_context, :iteration_counter
  end
end
