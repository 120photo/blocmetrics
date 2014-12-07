class EventWorker
  include Sidekiq::Worker
  require 'uri'

  def perform(user, event_name, event_data, event_ip, event_agent, event_uri)

    if Website.where(url: event_uri).where(verified: true)
      @event = Event.new
      @event.user = user
      @event.name = event_name
      @event.data = event_data
      @event.ip = event_ip
      @event.agent = event_agent
      @event.uri = event_uri
    else
      render json: {error: "Site not Verified"},status: :unauthorized and return
    end
  end
end
