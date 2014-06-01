Rails.application.routes.draw do
   root 'welcome#index'
   post '/users', to: 'registrations#create'
end
