ImagineCms::Application.routes.draw do
  resources :posts, only: [:index, :show]

  resources :comedies do
    collection do
      get 'list'
    end
  end
  resources :videos, only: :index
  resources :images, only: :index

  devise_for :users

  root 'comedies#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
