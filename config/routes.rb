Rails.application.routes.draw do
  resources :portfolios
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]
  root to: 'static#home'
end
