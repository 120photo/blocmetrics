class Api::V1::EventsController < Api::V1::BaseController
  require 'uri'

  def create

    host = current_user.get_domain(request.referer)

    if current_user
      EventWorker.perform_async(
        current_user.id,
        params[:name],
        params[:data],
        request.env["REMOTE_ADDR"],
        request.user_agent,
        host
      )
    end

    render nothing: true, status: :created

  end
end
