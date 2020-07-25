Rails.application.routes.draw do

  namespace :member do
    get 'orders/new' => "orders#new"
    post :confirm
    get 'orders/confirm' => "orders#confirm"
    get 'orders/thank' => "orders#thank"
  end


  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  root 'admin/homes#top'
  get '/members/about' => 'members#about'
  get '/admin/products' => 'admin/products#index'

  devise_for :members

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :admin do
resources :members, only: [:show, :edit, :update, :index]
end
scope module: :member do
	resources :orders, only: [:index,:show]

end


  resources :products, xcept: [:destroy]


    namespace :admin do
        resources :genres, only: [:index, :create, :edit, :update]
    end

    namespace :member do
        resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    end


end
