class GroupsController < ApplicationController
  before_action :authenticate_organisation!
  before_action :authenticate_user!


  layout "organisations"

  layout "users", :only => [:events,:jobs,:skills,:index]



  def index
     @group_announcements = current_organisation.announcements.all
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

  def skills
    @group_skills = current_organisation.users.all
  end

  def invite
    redirect_to jobs_groups_url
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
