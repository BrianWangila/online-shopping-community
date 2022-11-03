# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 

  post '/search', to: 'searches#create'

  post '/signup', to: 'users#create'
  post '/login', to: 'auth#create'
  get 'me', to: 'users#profile'

  get 'searches', to: 'searches#index'

  get 'trends', to: 'searches#trends'

  get 'trends/:search_id', to: 'products#trending'
  get 'toptrends', to: 'products#toptrends'

  get 'history', to: 'searches#history'
  
  root "welcome#index"
end
