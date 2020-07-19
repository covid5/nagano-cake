Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, xcept: [:destroy]

    namespace :admin do
        resources :genres, only: [:index, :create, :edit, :update]
    end

end
