class Api::V1::EventsController < Api::V1::BaseController
  require 'uri'

  def create

    if current_user
      EventWorker.perform_async(
        current_user, params[:name],
        params[:data],
        request.env["REMOTE_ADDR"],
        request.user_agent,
        URI.parse(request.referer).host
      )
    end

    # Important. if the worker find out that this is an unauthorized request. it won't create the event.
    render nothing: true, status: :created
  end
end
