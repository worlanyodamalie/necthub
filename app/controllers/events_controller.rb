class EventsController < ApplicationController
  before_action :authenticate_organisation!

  layout "organisations"

  def index
    @events = current_organisation.events
    #@organisation = Event.new
  end

  def new
    @event = Event.new
  end

  def create

    @event = current_organisation.events.build(event_params)
    if @event.save
      flash[:notice] = "Added event successfully"
      render 'index'
    else
      flash[:alert] = "Event not added"
      render 'new'
      end
  end

  private

  def event_params
    params.require(:event).permit(:event_name,:event_type,:event_date,:event_pic)
  end
end
