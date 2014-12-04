class Api::V1::EventsController < Api::V1::BaseController
  require 'uri'

  def create

    if current_user
      @event = Event.new
      @event.name = params[:name]
      @event.data = params[:data]
      @event.user = current_user
      @event.ip = request.env["REMOTE_ADDR"]
      # @event.host = request.env["REMOTE_HOST"]
      #               request.referer
      @event.agent = request.user_agent
      # @event.uri = URI.parse(request.referer).host
      @event.save
    end
    # EventWorker.perform_async(user_id, event_name, event_Data)

    # Create a worker that creates an event for the domain that submitted the request

    # 1. Read about the Rails request object and find a way to extract where the request to this method came from.
    # The worker should accept the following parameters:
    # 1. The submitting domain
    # 2. The event name
    # 3. current_user's id
    # 4. any other of custom data you see fit
    # HTTP_USER_AGENT, REMOTE_ADDR, REQUEST_URI

    # Important. if the worker find out that this is an unauthorized request. it won't create the event.
    render nothing: true, status: :created
  end
end
