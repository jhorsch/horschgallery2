  Horschgallery2::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'static_pages#home'

  resources :photos
  resources :categories
  resources :main_categories
  resources :charges
  # resources :line_items, only: [:create,:destroy]
  post '/line_items' => 'line_items#create', as: :line_items
  delete '/line_items/:id' => 'line_items#destroy', as: :line_item

  resources :orders


  get "/home" => 'static_pages#home'
  get '/search' => 'photos#search'

  #static pages
  get "/photographers" => 'static_pages#photographers'
  get "/shopping_cart" => 'static_pages#cart'
  get "/email" => 'static_pages#email'

  get "/reviews" => 'static_pages#reviews'
  get "/art_fairs" => 'static_pages#art_fairs'
  get "/faq" => 'static_pages#faq'
  get "/returns" => 'static_pages#returns'

  #404 page
  get "/error" => 'static_pages#errors', as: :error

  # add/delete to shopping cart
  # put '/cart' => 'cart#create', as: :cart_add_item
  # delete '/cart/:id' => 'cart#destroy', as: :cart_remove_item

  #Place order
  get "/payment" => 'orders#new'
   # as: :payment, constraints: {protocol: "https", subdomain: "secure"}
  put "/payment/:id" => 'orders#create'
  get "/confirmation" => 'static_pages#confirmation'


end
