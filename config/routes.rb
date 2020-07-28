Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  root 'admin/homes#top'
  get '/members/about' => 'members#about'


  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :member do
      resources :products, only: [:index, :show]
      resources :carts, only: [:index, :create, :update, :destroy]
      delete '/empty_item' => 'carts#empty_item'
      resources :cart_products
      resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
      resources :orders, only: [:index,:show]
  end

  namespace :admin do
    resources :members, only: [:show, :edit, :update, :index]
    resources :products, xcept: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end


end
