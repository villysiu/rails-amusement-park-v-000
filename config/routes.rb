Rails.application.routes.draw do


  
  get    '/signup',  to: 'users#new'
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :attractions
  resources :users
  resources :rides
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#home'
end
