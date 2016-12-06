module ApplicationHelper
  def link_to_login_or_logout
    if current_user
      link_to "Logout", destroy_user_session_path, method: :delete
    else
      link_to "Login", new_user_session_path
    end
  end
end
