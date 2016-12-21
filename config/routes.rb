Rails.application.routes.draw do
  root to: "welcome#index"

  devise_for :users, path: ''

  resources :businesses, param: :business_name, only: [:index, :show]

  namespace :admin do
    root 'faires#index', as:'/'
    resources :faires, except: :index
    resources :events, except: [:index, :show, :destroy]
  end
end
