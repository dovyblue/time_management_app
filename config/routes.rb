Rails.application.routes.draw do
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/tasks' => 'tasks#index'
  get '/tasks/new' => 'tasks#new'
  post '/tasks' => 'tasks#create'
  get 'tasks/:id' => 'tasks#show'
  get 'tasks/:id/edit' => 'tasks#edit'
  patch 'tasks/:id' => 'tasks#update'
  delete '/tasks/:id' => 'tasks#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
