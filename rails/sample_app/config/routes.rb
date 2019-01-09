Rails.application.routes.draw do
  root 'static_pages#home'
  get '/login',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'

  get 'users/new'
  get '/help',to: 'static_pages#help'
  get '/about',to: 'static_pages#about'

  get '/signup', to: 'users#new'
  post '/signup',to: 'users#create'
  resources :users
end
