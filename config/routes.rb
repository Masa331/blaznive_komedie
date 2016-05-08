Rails.application.routes.draw do
  # Uncomment this for enabling maintenance page
  # get '*x/*x', to: 'static_pages#under_construction'
  # root 'static_pages#under_construction'

  resources :comedies
  resources :search_results, only: :index

  namespace :comedy do
    resources :thumbnails, only: [:index]
  end

  resources :videos, only: :index
  resources :images, only: :index

  root 'comedies#index'
end
