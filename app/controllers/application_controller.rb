class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= Vendor.find(session[:vendor_id]) if session[:vendor_id]
  end
end
