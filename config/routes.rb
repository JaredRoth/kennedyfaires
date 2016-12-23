Rails.application.routes.draw do
  root to: "welcome#index"

  devise_for :users, path: ''

  resources :businesses, only: [:index, :show, :new, :create, :edit, :update]

  namespace :admin do
    root 'faires#index', as:'/'
    resources :faires, except: :index
    resources :events, except: [:index, :show, :destroy]
  end
end
