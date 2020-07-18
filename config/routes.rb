Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }
  root 'homes#top'
end
