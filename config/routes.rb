Rails.application.routes.draw do
  root to: "welcome#index"

  devise_for :users, path: ''

  namespace :admin do
    root 'events#index', as:'/'
    resources :events, except: :index
  end
end
