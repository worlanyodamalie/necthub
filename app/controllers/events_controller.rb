class EventsController < ApplicationController
  before_action :authenticate_organisation!

  layout "organisations"

  def index
    #byebug
    @events = current_organisation.events

    #@organisation = Event.new
  end

  def new
    @a_event = Event.new
  end

  def create

    @a_event = current_organisation.events.build(event_params)
    if @a_event.save
      #flash[:notice] = "Added event successfully"
      render 'index'
    else
      #flash[:alert] = "Event not added"
      render 'new'
      end
  end

  private

  def event_params
    params.require(:event).permit(:event_name,:event_type,:event_date,:event_pic)
  end
end
