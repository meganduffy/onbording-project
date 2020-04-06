Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/signup', to: 'users#new'
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'secret-page', to: 'pages#secret_page'

  get '/article', to: 'articles#index'
  get '/article/new', to: 'articles#new'
  post '/article/new', to: 'articles#create'
end
