Rails.application.routes.draw do
  
  get '/' => 'time_management_app#about'
  get '/todays-tasks' => 'time_management_app#todays_tasks'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
    
  get '/user-preferences' => 'user_preferences#index'
  get '/user-preferences/new' => 'user_preferences#new'
  post '/user-preferences' => 'user_preferences#create'
  get '/user-preferences/:user_id/edit' => 'user_preferences#edit'
  patch '/user-preferences/:user_id' => 'user_preferences#update'
  
  get '/tasks' => 'tasks#index'
  get '/tasks/new' => 'tasks#new'
  post '/tasks' => 'tasks#create'
  get 'tasks/:id' => 'tasks#show'
  get 'tasks/:id/edit' => 'tasks#edit'
  patch 'tasks/:id' => 'tasks#update'
  delete '/tasks/:id' => 'tasks#destroy'

  get '/days' => 'days#index'
  post '/days' => 'days#create'
  get '/days/:date' => 'days#show'
  
  get '/:date/task-to-dos/new' => 'task_to_dos#new'
  post '/task-to-dos' => 'task_to_dos#create'
  get '/:date/task-to-dos/edit' => 'task_to_dos#edit'
  patch '/task-to-dos' => 'task_to_dos#update'
  delete '/:date/task_to_dos/:id' => 'task_to_dos#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/tasks' => 'tasks#index'
      post '/tasks' => 'tasks#create'
      patch '/tasks/:id' => 'tasks#update'
      delete '/tasks/:id' => 'tasks#destroy'
    end
  end
end
