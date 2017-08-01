class NetworksController < ApplicationController
   before_action :authenticate_organisation!

  layout "organisations"
  
  def index
  end
end
