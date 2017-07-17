class MembershipdataController < ApplicationController
   before_action :authenticate_organisation!

   layout "organisations"

  def index
    @members = current_organisation.membershipdata
  end

  def members
  end

  def new
    @membershipdatum = Membershipdatum.new
  end


  def upload_params
    params[:files]
  end

  def import

    upload(upload_params,current_organisation.id)

    redirect_to membershipdata_url
  end




private

  def membershipdata_params
    params.require(:Membershipdatum).permit(:FirstName,:LastName,:YearCompleted,:Email,:Organisation,:WorkPlace,:PhoneNumber)
  end
end
