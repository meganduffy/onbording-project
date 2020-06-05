Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/signup', to: 'users#new'
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'secret-page', to: 'pages#secret_page'

  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new'
  post '/articles/new', to: 'articles#create'
  get '/articles/:id', to: 'articles#show', as: 'article'
  get '/articles/:id/edit', to: 'articles#edit'
  patch '/articles/:id', to: 'articles#update'
  get '/articles/:id/delete', to: 'articles#destroy'
  get '/articles/:id/recover', to: 'articles#recover', as: 'recover'

  # match "*path", to: 'pages#home', :via => [:get, :post]
end
