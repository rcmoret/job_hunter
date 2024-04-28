# frozen_string_literal: true

module HasJobListingEventParams
  def permitted_params
    params
      .require(:job_listing_event)
      .permit(:event_time, :info, :event_type_id)
  end

  def event_params
    permitted_params
      .to_h
      .reject { |key, _| key.starts_with?("event_time") }
      .merge(event_time: event_time)
  end

  def event_time
    @event_time ||= Time.new(
      permitted_params["event_time(1i)"],
      permitted_params["event_time(2i)"],
      permitted_params["event_time(3i)"],
      permitted_params["event_time(4i)"],
      permitted_params["event_time(5i)"]
    ).in_time_zone(current_user.configuration("timezone"))
  end
end
