Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmli
  root to: "products#index"

  resources :products
  resources :stores
  resources :categories
  resources :subscriptions
  
  devise_for :users, :controllers => { registrations: 'registrations'}
end
