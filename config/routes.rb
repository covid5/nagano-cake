Rails.application.routes.draw do

  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  root 'admin/homes#top'
  get '/members/about' => 'members#about'


  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :members, only: [:show, :edit, :update, :index]
    resources :products, xcept: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :member do
    resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:index,:show]
  end

end
