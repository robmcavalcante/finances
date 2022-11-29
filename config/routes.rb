Rails.application.routes.draw do
  get 'revenues/index'
  get 'category/index'
  root "dashboard#index"

  resources :cards
  resources :revenues
  resources :categories
  resources :transactions
end
