class EventsController < ApplicationController
  def index
  end

  def show
    @event = Event.find(params[:id])

    @markers = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]    
  end
end
