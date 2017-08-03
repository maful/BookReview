Rails.application.routes.draw do
  scope 'admin' do
    resources :authors
  end
  get 'home', to: 'home#index'
  root 'home#index'
end
