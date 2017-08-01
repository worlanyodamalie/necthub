class MembershipdataController < ApplicationController
   before_action :authenticate_organisation!

   layout "organisations"

  def index
    @members = current_organisation.membershipdata
  end

  def members
  end

  def upload_params
    params[:files]
  end

  def import

    upload(upload_params,current_organisation.id)

    redirect_to membershipdata_url
  end



  def new
    @membership = Membershipdatum.new
  end

  def create
   # byebug
     @membership = current_organisation.membershipdata.build(membershipdata_params)
     if @membership.save
       redirect_to membershipdata_path
      else
        redirect_to new_membershipdatum_path
        end
  end





private



   def membershipdata_params
    params.require(:membershipdatum).permit(:FirstName,:LastName,:YearCompleted,:Email,:Organisation,:WorkPlace,:PhoneNumber)
   end

end
