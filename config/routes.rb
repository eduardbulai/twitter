Twitter::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :queries, only: [:new, :create, :destroy]
  root to: 'static_pages#home'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  get '/help', 		to: 'static_pages#help'
  get '/about', 	to: 'static_pages#about'
  get '/contact', 	to: 'static_pages#contact'

  resources :tweets

end
