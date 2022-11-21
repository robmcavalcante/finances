Rails.application.routes.draw do
  get 'category/index'
  root "dashboard#index"

  resources :cards
  resources :categories
end
