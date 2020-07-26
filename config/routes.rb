Rails.application.routes.draw do

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  root 'admin/homes#top'
  get '/members/about' => 'members#about'
  get '/admin/products' => 'admin/products#index'

  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :products, xcept: [:destroy]

  namespace :admin do
      resources :genres, only: [:index, :create, :edit, :update]
      resources :members, only: [:show, :edit, :update, :index]
  end

  namespace :member do
      resources :products, only: [:index, :show]
      resources :carts, only: [:index, :create, :update, :destroy]
      delete '/empty_item' => 'carts#empty_item'
      resources :cart_products
  end

  scope module: :member do
	      resources :orders, only: [:index,:show]
    end

end

