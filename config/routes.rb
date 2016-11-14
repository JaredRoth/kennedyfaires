Rails.application.routes.draw do
  root to: "welcome#index"

  get "/admin/dashboard", to: "events#index", as: "admin_root"

  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout'}
  devise_for :vendors, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
end
