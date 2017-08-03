class OrganisationsController < ApplicationController
  before_action :authenticate_organisation!, except: [:invite, :join]

  layout "organisations"

  layout "application", :only => [:invite]

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


  def join
    organisation = Organisation.find_by(id: params[:id])
    puts '@' * 300
    puts organisation
    if organisation
      user = User.new(email: params[:email], password: params[:password])
      if user.save
        user.groups << Group.new(user: user, organisation: organisation)
        #redirect_to organisation_groups_path(organisation.id)
        redirect_to userfeed_path
      else
        render :invite
      end
    end
  end

 def invite
   @organisation = Organisation.find_by(id: params[:id])
 end


 def share
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
