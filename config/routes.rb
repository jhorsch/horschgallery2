  Horschgallery2::Application.routes.draw do
  get "order/new"
  get "order/create"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'static_pages#home'

  resources :photos
  resources :categories
  resources :main_categories
  resources :charges

  get "/home" => 'static_pages#home'
  get '/search' => 'photos#search'

  #static pages
  get "/photographers" => 'static_pages#photographers'
  get "/shopping_cart" => 'static_pages#cart'

  get "/reviews" => 'static_pages#reviews'
  get "/art_fairs" => 'static_pages#art_fairs'
  get "/faq" => 'static_pages#faq'
  get "/returns" => 'static_pages#returns'

  #404 page
  get "/error" => 'static_pages#errors', as: :error

  # add/delete to shopping cart
  put '/cart' => 'cart#create', as: :cart_add_item
  delete '/cart/:id' => 'cart#destroy', as: :cart_remove_item

  #Place order
  get "/payment" => 'order#new'
  get "/confirmation" => 'static_pages#confirmation'


end
