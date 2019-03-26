Rails.application.routes.draw do
  get 'followings/index'
  get 'followers/index'
  get 'words/index'
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#dashboard'
  namespace :admin do
    resources :users, only: [:index,:update]
    resources :categories do
      resources :words 
    end
  end
  
  resources :users do
    resources :words
    resources :followers, only: [:index]
    resources :followings, only: [:index]
  end
  resources :sessions, only: [:create]
  resources :relationships, only: [:create,:destroy]
  resources :categories, only: [:index]
  resources :lessons do
    resources :answers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
