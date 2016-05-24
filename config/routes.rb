Rails.application.routes.draw do
  resource :user, only: [:show]

  post 'logins/create'
  get 'logins/new'
  get 'sessions/create'
  delete 'sessions/destroy'

  resources :comedies
  resources :search_results, only: :index

  namespace :comedy do
    resources :thumbnails, only: [:index]
  end

  resources :videos, only: :index
  resources :images, only: :index

  root 'comedies#index'
end
