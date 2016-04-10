Rails.application.routes.draw do
  # Uncomment this for enabling maintenance page
  # get '*x/*x', to: 'static_pages#under_construction'
  # root 'static_pages#under_construction'

  resources :comedies do
    collection do
      get 'list'
    end
  end
  resources :videos, only: :index
  resources :images, only: :index

  root 'comedies#index'
end
