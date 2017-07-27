class EventsController < ApplicationController
  before_action :authenticate_organisation!

  layout "users", :only => [:eventsearch]

  layout "organisations"

  def index
    #byebug
    @events = current_organisation.events.all

    #@organisation = Event.new
  end

  def eventsearch
    if params[:search].present?
      @eventsearchs = Event.perform_search(params[:search])
    else
      redirect_to eventsearch_events_path,  notice: "No Search results available at the moment"
    end
  end

  def new
    @a_event = Event.new
  end

  def create

    @a_event = current_organisation.events.build(event_params)
    if @a_event.save
      #flash[:notice] = "Added event successfully"
      redirect_to events_path
    else
      #flash[:alert] = "Event not added"
      #render 'new'
      redirect_to new_event_path
      end
  end

  private

  def event_params
    params.require(:event).permit(:event_name,:event_type,:event_date,:event_pic)
  end
end
