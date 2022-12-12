Rails.application.routes.draw do
  root to: redirect('/dashboard')
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  resources :cards
  resources :expenses
  resources :categories
  resources :transactions

  get '/card/:id/invoices', to: 'invoices#index'
end