class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_url
    else 
      render :action => "new"
    end
  end
  
  def index
    @events = Event.all
  end

end
