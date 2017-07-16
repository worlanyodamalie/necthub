class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #after_filter :store_action
  after_action :store_action
  include MembershipdataHelper


#Redirect after sign in
  def store_action
    return unless request.get?
    if (request.path != "/organisations/sign_in" &&
        request.path != "/organisations/sign_up" &&
        request.path != "/organisations/password/new" &&
        request.path != "/organisations/password/edit" &&
        request.path != "/organisations/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:organisation, "/dashboard")
    end
  end

end





  # def after_sign_in_path_for(resource_or_scope)
  #       stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  # end

  # def after_sign_in_path_for(organisations)
  #    "/dashboard"
  # end

