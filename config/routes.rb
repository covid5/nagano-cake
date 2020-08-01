Rails.application.routes.draw do
  devise_for :members

  get "/members/about" => "members#about"
  get "/members/top" => "members#top"
  get "/members/withdraw" => "members#withdraw"
  patch "/members/hide" => "members#hide"
  resources :members

  devise_scope :admin do
    root "admins/sessions#new"
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
  get 'admin/top' => "admin/homes#top"

  namespace :admin do
    resources :orders, only: [:index, :show]
    patch '/orders/:id/update' => 'orders#update'
    patch 'order_details/:id/update' => 'order_details#update'
    resources :members, only: [:show, :edit, :update, :index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products, xcept: [:destroy]
    get '/search' => 'search#search'
  end

  namespace :member do
      resources :products, only: [:index, :show]
      resources :carts, only: [:index, :create, :update, :destroy]
      delete '/empty_item' => 'carts#empty_item'
      resources :cart_products
      resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
      resources :orders, only: [:index, :show, :new]
      get 'orders/confirm' => "orders#confirm"
      post 'orders/confirm' => 'oders#confirm'
      get 'orders/thank' => "orders#thank"
  end

end
