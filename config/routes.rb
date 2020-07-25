Rails.application.routes.draw do
  namespace :member do
    get 'orders/new' => "orders#new"
    post :confirm
    get 'orders/confirm' => "orders#confirm"
    get 'orders/thank' => "orders#thank"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, xcept: [:destroy]

    namespace :admin do
        resources :genres, only: [:index, :create, :edit, :update]
    end

end
