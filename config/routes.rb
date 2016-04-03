Rails.application.routes.draw do
  resources :comedies do
    collection do
      get 'list'
    end
  end
  resources :videos, only: :index
  resources :images, only: :index

  root 'comedies#index'
end
