Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmli
  root to: "products#index"

  devise_for :users, :controllers => { registrations: 'registrations'}
  
  resources :products
  resources :stores
  resources :categories
  resources :users do
    resources :subscriptions
  end
  
end
