Rails.application.routes.draw do
  root to: redirect('/dashboard')

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  resources :cards
  resources :revenues
  resources :categories
  resources :transactions
end
