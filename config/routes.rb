ImagineCms::Application.routes.draw do
  namespace :admin do
    resources :comedies
    resources :categories
    resources :images
    resources :videos
  end

  resources :comedies

  devise_for :admins

  get "static_pages/contacts"
  root 'comedies#index'
end
