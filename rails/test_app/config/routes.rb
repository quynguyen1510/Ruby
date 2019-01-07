Rails.application.routes.draw do
  get '/help',to: 'example#help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/signup',to: 'users#new'
  root :to => 'example#home'
end
