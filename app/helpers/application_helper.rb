module ApplicationHelper
  def vendor_link_to_login_or_logout
    if current_vendor
      link_to "Logout", destroy_vendor_session_path
    else
      link_to "Login", new_vendor_session_path
    end
  end
end
