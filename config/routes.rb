Rails.application.routes.draw do
  resources :comedies
  resources :search_results, only: :index

  namespace :comedy do
    resources :thumbnails, only: [:index]
  end

  resources :videos, only: :index
  resources :images, only: :index

  root 'comedies#index'
end
