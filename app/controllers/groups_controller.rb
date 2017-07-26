class GroupsController < ApplicationController
  before_action :authenticate_organisation!

  layout "users"


  def index

  end

  def new
    @group = Group.new
  end

  def events
     @group_events = current_organisation.events.all
  end

  def jobs
    @group_jobs = current_organisation.jobs.all
  end


  def create
    @group = current_organisation.groups.build(group_params)
    if @group.save
      #flash[:notice] = "Group created successfully"
      # redirect_to  organisation_groups_path(current_organisation.id)
      redirect_to  organisation_group_url(current_organisation.id,@group.id)
    else
      #flash[:alert] = "Group not created successfully"
      render 'new'
      end
  end


   def show
     #@group = group.find(params[:id])
  end


private
  def group_params
    params.require(:group).permit(:group_name)
  end

end
