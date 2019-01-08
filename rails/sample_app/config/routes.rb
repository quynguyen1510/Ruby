Rails.application.routes.draw do
  get 'users/new'
  get '/help',to: 'static_pages#help'
  get '/about',to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup',to: 'users#create'
  get '/welcome', to: 'static_pages#welcome'
  root 'static_pages#home'
  resources :users
end
