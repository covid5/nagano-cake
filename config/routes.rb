Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
end
=======

  resources :products, xcept: [:destroy]

    namespace :admin do
        resources :genres, only: [:index, :create, :edit, :update]
    end

end
>>>>>>> b2635aaef241dae977f175eabfb82432a1876257
