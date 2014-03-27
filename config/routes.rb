Horschgallery2::Application.routes.draw do
  root 'static_pages#home'
  resources :photos
  resources :categories
  get "/home" => 'static_pages#home'
  get "/photographers" => 'static_pages#photographers'
  get "/shopping_cart" => 'static_pages#shopping_cart'
  get "/confirmation" => 'static_pages#confirmation'
  get "/payment" => 'static_pages#payment'
  get '/search' => 'photos#search', :as => 'search'
end
