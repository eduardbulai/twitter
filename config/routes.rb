Twitter::Application.routes.draw do
  get "tweets/index"
  get "tweets/show"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :tweets
  
  #root :to => "tweets#index"
  root to: 'static_pages#home'

  get '/signup',  to: 'users#new', 			via: 'get'
  get '/signin',  to: 'sessions#new', 		via: 'get'
  get '/signout', to: 'sessions#destroy', 	via: 'delete'

  get '/help', 		to: 'static_pages#help'
  get '/about', 	to: 'static_pages#about'
  get '/contact', 	to: 'static_pages#contact'

end
