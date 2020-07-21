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
    end

    namespace :member do
        resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    end

end

