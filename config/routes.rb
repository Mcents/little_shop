
Rails.application.routes.draw do


  root to: "dashboards#index"
  resources :users
  resources :brands
  resources :products
  resources :categories
  resources :shopping_carts

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/cart", to: "shopping_carts#index"
  put "/cart", to: "shopping_carts#remove"

  get '/:category_name', to: 'categories#show'

end
