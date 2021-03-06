class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_path
    else
      vendor_home(resource)
    end
  end

  def vendor_home(vendor)
    if vendor.try(:businesses).try(:count) == 1
      business_path(vendor.businesses.first)
    else
      businesses_path
    end
  end

  def require_login
    redirect_to new_user_session_path unless current_user
  end

  def not_found
    raise ActionController::RoutingError.new("Not Found")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
