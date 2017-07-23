class GroupsController < ApplicationController
  before_action :authenticate_organisation!

  def index
  end

  def new
    @group = Group.new
  end

  def show
     @group = group.find(params[:id])
  end

  def create
    @group = current_organisation.groups.build(group_params)
    if @group.save
      flash[:notice] = "Group created successfully"
      redirect_to  organisation_organisation_groups_url
    else
      flash[:alert] = "Group not created successfully"
      render 'new'
      end
  end

private
  def group_params
    params.require(:group).permit(:group_name)
  end

end
