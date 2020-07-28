Rails.application.routes.draw do
  get 'order_details/update'
  namespace :admin do
    resources :orders, only: [:index, :show]
    patch '/orders/:id/update' => 'admin/orders#update'
    patch 'order_details/:id/update' => 'admin/order_details#update'
    resources :members, only: [:show, :edit, :update, :index]
    resources :genres, only: [:index, :create, :edit, :update]
  end


  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  root 'admin/homes#top'
  get '/members/about' => 'members#about'
  get '/admin/products' => 'admin/products#index'

  devise_for :members



scope module: :member do
	resources :orders, only: [:index,:show]
end


  resources :products, xcept: [:destroy]


    namespace :member do
        resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    end


end

