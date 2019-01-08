Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'
  get '/help',to: 'static_pages#help'
  get '/about',to: 'static_pages#about'
  get '/signup', to: 'users#new'
  root 'static_pages#home'
  resources :users
end
