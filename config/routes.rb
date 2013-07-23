Twitter::Application.routes.draw do
  get "users/new"
  root to: 'static_pages#home'
  #match '/signup', to: 'users#new'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

end