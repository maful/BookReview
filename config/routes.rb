Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :authors, :books
  end

  resources :books, only: [:show]

  get 'home', to: 'home#index'
  root 'home#index'
end
