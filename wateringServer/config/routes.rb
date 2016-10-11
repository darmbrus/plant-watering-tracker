Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # TODO Clean up routes to only used paths
  resources :users
  resources :plants
  namespace :plants do
    resources :waterings
  end
end
