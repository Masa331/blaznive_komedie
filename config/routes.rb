Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :show]

  resources :comedies do
    collection do
      get 'list'
    end
  end
  resources :videos, only: :index
  resources :images, only: :index

  # devise_for :users

  root 'comedies#index'

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
