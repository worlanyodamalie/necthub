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
    # SmsghSms.api_client_id = ENV['SmsghSms.api_client_id']
    # SmsghSms.api_client_secret = ENV['SmsghSms.api_client_secret']

    # @message = params

    # message_params = {
    #       :from => @message[:from],
    #       :to => @message[:to],
    #       :msg => @message[:msg]
    # }




    # SmsghSms.push(message_params)

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


  #SmsghSms.push(:to => 'PHONE-NUMBER', :msg => "Your SMS Message goes here", :from => "SENDERID")
  # def send_email
  #  #@receipients = cookies[:email_token ]

  #  #render json: @receipients
  #   to = params[:to]

  #   subject = params[:subject]

  #   body = params[:body]

  #  SendMailer.send_email(to,subject,body,@organisation).deliver

  # end




  def members
  end



end
