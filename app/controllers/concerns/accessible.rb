# ../controllers/concerns/accessible.rb
module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    flash.clear
    if current_organisation
      # if you have rails_admin. You can redirect anywhere really
      redirect_to("/dashboard") && return
    elsif current_user
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to("/userfeed") && return
    end
  end
end