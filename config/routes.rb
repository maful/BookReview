Rails.application.routes.draw do
  namespace :admin do
    resources :authors, :books
  end

  resources :books, only: [:show]

  get 'home', to: 'home#index'
  root 'home#index'
end
