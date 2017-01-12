Rails.application.routes.draw do
  root to: "welcome#index"

  devise_for :users, path: ''

  resources :businesses, only: [:index, :show, :new, :create, :edit, :update]

  resources :events, only: [] do
    resources :applications, only: [:new, :create]
  end

  namespace :admin do
    root 'faires#index', as:'/'
    resources :faires, except: :index
    resources :events, except: [:index, :show, :destroy]
  end

  get "/:name", to: "cities#show", as: :city

end
