Rails.application.routes.draw do
  get '/about' => 'time_management_app#about'
  get '/todays-tasks' => 'time_management_app#todays_tasks'

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

  get '/days' => 'days#index'
  post '/days' => 'days#create'
  get '/days/:date' => 'days#show'
  
  get '/:date/task-to-dos/new' => 'task_to_dos#new'
  post '/task-to-dos' => 'task_to_dos#create'
  get '/:date/task-to-dos/edit' => 'task_to_dos#edit'
  patch '/task-to-dos' => 'task_to_dos#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
