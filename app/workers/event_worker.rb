class EventWorker
  include Sidekiq::Worker

  def perform(event_id)
    @event = Event.new
  end
end
