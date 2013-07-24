Twitter::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  root to: 'static_pages#home'

  get '/signup',  to: 'users#new', 			via: 'get'
  get '/signin',  to: 'sessions#new', 		via: 'get'
  get '/signout', to: 'sessions#destroy', 	via: 'delete'

  get '/help', 		to: 'static_pages#help'
  get '/about', 	to: 'static_pages#about'
  get '/contact', 	to: 'static_pages#contact'

end
