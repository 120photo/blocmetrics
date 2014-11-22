class Api::V1::EventsController < Api::V1::BaseController


  def create()
    respond_to :json
    @event = Event.new
    @event.name = name
    # TODO fixt propert1 to read property1
    @event.propert1 = property1
    @event.value1 = value1
    @event.property2 = property2
    @event.value2 = value2
    @event.save
  end
end
