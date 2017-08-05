Rails.application.routes.draw do
  scope 'admin' do
    resources :authors, :books
  end
  get 'home', to: 'home#index'
  root 'home#index'
end
