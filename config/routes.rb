Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/members/about" => "members#about"
  get "/members/top" => "members#top"
  get "/members/withdraw" => "members#withdraw"
  get "/members/edit" => "members#edit"

  resources :products, xcept: [:destroy]

    namespace :admin do
        resources :genres, only: [:index, :create, :edit, :update]
    end
end

