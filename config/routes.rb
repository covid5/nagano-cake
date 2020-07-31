Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only: [:index, :show]
    patch '/orders/:id/update' => 'orders#update'
    patch 'order_details/:id/update' => 'order_details#update'
    resources :members, only: [:show, :edit, :update, :index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products, xcept: [:destroy]
    get '/search' => 'search#search'
  end

  namespace :member donamespace :member do
      resources :products, only: [:index, :show]
      resources :carts, only: [:index, :create, :update, :destroy]
      delete '/empty_item' => 'carts#empty_item'
      resources :cart_products
      resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
      resources :orders, only: [:index, :show, :new]
      post :confirm
      get 'orders/confirm' => "orders#confirm"
      get 'orders/thank' => "orders#thank"
  end


  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  root 'admin/homes#top'

  devise_for :members

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/members/about" => "members#about"
  get "/members/top" => "members#top"
  get "/members/withdraw" => "members#withdraw"
  get "/members/edit" => "members#edit"  

end
