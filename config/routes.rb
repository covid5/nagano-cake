Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only: [:index, :show]
    patch '/orders/:id/update' => 'admin/orders#update'
    patch 'order_details/:id/update' => 'admin/order_details#update'
    resources :members, only: [:show, :edit, :update, :index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products, xcept: [:destroy]
  end

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  root 'admin/homes#top'
  get '/members/about' => 'members#about'


  devise_for :members


  namespace :member do
      resources :products, only: [:index, :show]
      resources :carts, only: [:index, :create, :update, :destroy]
      delete '/empty_item' => 'carts#empty_item'
      resources :cart_products
      resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
      resources :orders, only: [:index,:show]
  end


end
