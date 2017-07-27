class  SignupsController < Devise::RegistrationsController
  include Accessible

  private
    def sign_up_params
      params.require(:user).permit(:first_name,:Last_name,:organisation_name,:email,:password,:password_confirmation,:phone_number,:profession,:education,:skills)
    end

    # def account_update_params
    #   params.require(:user).permit(:first_name,:Last_name,:organisation_name,:email,:phone_number,:profession,:education,:skills)
    # end

    # def update_resource(resource, account_update_params)
    # resource.update_without_password(account_update_params)
    # end
#  def after_sign_up_path_for(resource)
#     after_sign_in_path_for(resource)
#   end
    def  after_sign_up_path_for(users)
        "/userfeed"
    end

end