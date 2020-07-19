Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :admin do
resources :members, only: [:show, :edit, :update, :index]
end
scope module: :member do
	resources :orders, only: [:index,:show]
	
end
end
