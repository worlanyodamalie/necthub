class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  layout "users"

  def index
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'User updated Successfully'
    else
      render 'edit'
      end
  end


  private
   def set_user
     @user = User.find(params[:id])
   end

   def user_params
      params.require(:user).permit(:first_name,:Last_name,:organisation_name,:email,:phone_number,:profession,:education,:skills)
   end
end
