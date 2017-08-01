class OrganisationsController < ApplicationController
  before_action :authenticate_organisation!

  layout "organisations"

  def index

  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def new
    @memberlist = params[:memberlist]
    #print @memberlist
    redirect_to send_email
  end

  def sms
    @organisations = current_organisation.membershipdata
  end

  def send_message
  end

  def send_sms
     SmsghSms.api_client_id = "nxsvxkeb"
     SmsghSms.api_client_secret = "zkzfhzqz"
      @message = params

     message_params = {
           :from => @message[:from],
           :to => @message[:to],
           :msg => @message[:msg]
     }

     print message_params

     #byebug

     SmsghSms.push(message_params)

     redirect_to dashboard_url
  end


  def members
  end



end
