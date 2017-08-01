
Rails.application.routes.draw do
  root to: "dashboards#index"

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
    get '/dashboard/:id', to: 'dashboard#show', as: 'order'
    post '/dashboard', to: 'dashboard#edit_status'
    resources :products
  end

  resources :users
  resources :orders
  resources :brands
  resources :products
  resources :categories
  resources :shopping_carts

  get "/cart", to: "shopping_carts#index"
  put "/cart", to: "shopping_carts#update"
  delete "/update_cart", to: "shopping_carts#destroy"
  post "/order", to: "orders#create"

  get "/dashboard", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/:category_name', to: 'categories#show'
end
