class  SignupsController < Devise::RegistrationsController
  include Accessible

  private
    def sign_up_params
      params.require(:user).permit(:first_name,:Last_name,:organisation_name,:email,:password,:password_confirmation,:phone_number,:profession,:education,:skills)
    end


    def  after_sign_up_path_for(users)
        "/userfeed"
    end

end