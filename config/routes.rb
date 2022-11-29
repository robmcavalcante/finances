Rails.application.routes.draw do
  root "dashboard#index"

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  resources :cards
  resources :revenues
  resources :categories
  resources :transactions
end
