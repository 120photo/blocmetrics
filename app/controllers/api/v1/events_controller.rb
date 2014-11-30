class Api::V1::EventsController < Api::V1::BaseController


  def create

    #EventWorker.perform_async(key, event_name, event_data)

    @guest_ip = request.env["REMOTE_ADDR"]
    # @guest_host = request.env["REMOTE_HOST"] # will show domain
    @guest_agent = request.env["HTTP_USER_AGENT"]
    @page_visited = request.env["REQUEST_URI"]

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
