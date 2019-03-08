Rails.application.routes.draw do
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboad', to: 'users#dashboad'
  get 'lessoned_words', to: 'users#lessoned_words'
  
  resources :users
  resources :sessions, only: [:create]
  resources :relationships, only: [:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
