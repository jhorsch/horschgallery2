Horschgallery2::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'static_pages#home'
  resources :photos
  resources :categories
  resources :main_categories
  get "/home" => 'static_pages#home'
  get '/search' => 'photos#search'

  #static pages
  get "/photographers" => 'static_pages#photographers'
  get "/shopping_cart" => 'static_pages#shopping_cart'
  get "/confirmation" => 'static_pages#confirmation'
  get "/payment" => 'static_pages#payment'
  get "/reviews" => 'static_pages#reviews'
  get "/art_fairs" => 'static_pages#art_fairs'
  get "/faq" => 'static_pages#faq'
  get "/returns" => 'static_pages#returns'

  put '/cart/add' => 'cart#add', as: :cart_add
end
