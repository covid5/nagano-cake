Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, except: [:destroy]

    namespace :admin do
        resources :genres, only: [:index, :create, :edit, :update]
    end

    namespace :member do
    	resources :shipping_addresses, except: [:show, :new]
    end

end
