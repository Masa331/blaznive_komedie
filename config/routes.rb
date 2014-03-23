ImagineCms::Application.routes.draw do
  namespace :admin do
    resources :comedies
    resources :categories
    resources :images
    resources :videos
    resources :posts
    resources :links
  end

  resources :posts, only: [:index, :show]

  resources :comedies do
    collection do
      get 'list'
    end
  end
  resources :videos, only: :index
  resources :images, only: :index

  devise_for :admins

  get "static_pages/contacts"
  root 'comedies#index'
end
