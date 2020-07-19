Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :admin do
        resources :genres, only: [:index, :create, :edit, :update]
    end

    namespace :member do
    	resources :products, only: [:index, :show]
    	resources :cart_products, only: [:show]
    	post '/add_item' => 'cart_products#add_item'
    	post '/update_item' => 'cart_products#update_item'
    	delete '/delete_item' => 'cart_products#destroy_item'
    	delete '/empty_item' => 'cart_products#empty_item'
    end
end
