Rails.application.routes.draw do
  root 'posts#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout' to: 'sessions#destroy'

  resources :posts
  resources :users, only: [:new, :create]	  
end
