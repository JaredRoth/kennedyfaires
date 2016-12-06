Rails.application.routes.draw do
  root to: "welcome#index"

  devise_for :users, path: ''

  get "/admin", to: "admin/admin#show"

  # namespace :admin do
  #   get "/dashboard", to: "admin#show"
  # end

  # namespace :admin do
  #   root 'admin#show'
  # end

  # scope module: :admin do
  #   get '/dashboard', to: 'admin#show'
  # end
end
