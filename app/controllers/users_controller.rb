class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  layout "users"

  #layout "users", :only => [:skillsearch]



  def index
  end

  def edit
  end

  def skillsearch
     if params[:search].present?
      @skillsearchs = User.perform_search(params[:search])
    else
      redirect_to skillsearch_users_path,  flash[:notice] = "No Search results available at the moment"
    end
  end

   def memberprofilesearch
     if params[:search].present?
      @profilesearchs = User.perform_search(params[:search])
    else
      redirect_to memberprofilesearch_users_path,  flash[:notice] = "No Search results available at the moment"
    end
  end

   def skills
    @skills = User.all
   end

   def memberprofiles
     @memberprofiles = User.all
   end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
      #redirect_to @user, notice: 'User updated Successfully'
    else
      render 'edit'
      end
  end


  private
   def set_user
     @user = User.find(params[:id])
   end

   def user_params
      params.require(:user).permit(:first_name,:Last_name,:organisation_name,:email,:phone_number,:profession,:education,:skills,:user_pic,:YearGroup)
   end
end
