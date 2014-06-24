Rails.application.routes.draw do
  root 'welcome#index'
  post '/users', to: 'registrations#create'
  get '/destroy', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :teams
  resources :news
end
