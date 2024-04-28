# frozen_string_literal: true

module JobListings
  class DeleteJobListingLink < ViewComponent::Base
    erb_template <<-ERB
      <%=
        button_to "Delete listing",
          delete_job_listing_path(job_listing),
          method: :delete,
          data: { turbo_stream: false }
      %>
    ERB

    def initialize(job_listing)
      @job_listing = job_listing
    end

    attr_reader :job_listing
  end
end
