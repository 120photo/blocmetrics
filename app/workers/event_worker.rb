class EventWorker
  include Sidekiq::Worker

  def perform(user, event_name, event_data, event_ip, event_agent, event_uri)

    if Website.where(uri: event_uri).where(verified: true).first
      @event = Event.new
      @event.user_id = user
      @event.name = event_name
      @event.data = event_data
      @event.ip = event_ip
      @event.agent = event_agent
      @event.uri = event_uri
      @event.save
    end

  end
end
