ImagineCms::Application.routes.draw do
  namespace :admin do
    resources :posts
    resources :categories
    resources :images
    resources :videos
  end

  resources :posts

  devise_for :admins

  get "static_pages/contacts"
  root 'posts#index'
end
