Rails.application.routes.draw do
  get 'comment/index'

  get 'favorites/index'

  get 'topics/new'
  get 'topics/comment'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get '/login',    to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources 'users'
  resources 'topics'
  resources 'comments'
  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'

  post '/comments', to: 'comments#create'

  get 'topics/index'

end
