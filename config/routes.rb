
Rails.application.routes.draw do
  root to: "dashboards#index"

  # namespace :users do
  #   resources :orders
  # end

  # resources :users do
  #   resources :orders
  # end

  resources :users
  resources :orders
  # resources :users, except: [:show] do
  #   resources :orders
  # end
  resources :brands
  resources :products
  resources :categories
  resources :shopping_carts


  get "/cart", to: "shopping_carts#index"
  put "/cart", to: "shopping_carts#update"
  delete "/update_cart", to: "shopping_carts#destroy"

  get "/dashboard", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/:category_name', to: 'categories#show'
end
