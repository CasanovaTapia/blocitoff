Rails.application.routes.draw do
  devise_for :users
  
  resources :lists

  get 'home/index'

  root to: 'home#index'
end
