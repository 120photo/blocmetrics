class Api::V1::EventsController < Api::V1::BaseController
  require 'uri'

  def create

    host = URI.parse(request.referer).host # http://www.cnn.com => www.cnn.com

    if current_user
      EventWorker.new.perform(
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
