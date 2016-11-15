Rails.application.routes.draw do
  root to: "welcome#index"

  get "/admin/dashboard", to: "events#index", as: "admin_root"

  devise_for :admins, path: 'admin'
  devise_for :vendors, path: ''
end
