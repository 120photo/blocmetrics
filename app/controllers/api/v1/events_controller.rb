class Api::V1::EventsController < Api::V1::BaseController

  def create

    user = User.find_by(authentication_key: params[:key])

    if User.find_by(authentication_key: params[:key])
      @event = Event.new
      @event.name = params[:name]
      @event.data = params[:data]
      @event.user = user
      @event.ip = request.env["REMOTE_ADDR"]
      @event.host = request.env["REMOTE_HOST"]
      @event.agent = request.env["HTTP_USER_AGENT"]
      @event.uri = request.env["REQUEST_URI"]
      @event.save
    end

    #EventWorker.perform_async(params)

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
