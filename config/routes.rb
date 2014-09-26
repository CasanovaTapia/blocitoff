Rails.application.routes.draw do
  devise_for :users
  
  resources :lists do
    resources :items
  end

  get 'home/index'

  root to: 'home#index'
end
