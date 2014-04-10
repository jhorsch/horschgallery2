Horschgallery2::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'static_pages#home'
  resources :photos
  resources :categories
  resources :main_categories
  get "/home" => 'static_pages#home'
  get "/photographers" => 'static_pages#photographers'
  get "/shopping_cart" => 'static_pages#shopping_cart'
  get "/confirmation" => 'static_pages#confirmation'
  get "/payment" => 'static_pages#payment'
  get '/search' => 'photos#search'

  put '/cart/add' => 'cart#add', as: :cart_add
end
