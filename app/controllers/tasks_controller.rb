class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    task = Task.new(
      name: params[:task_name],
      length_time: params[:length_time],
      notes: params[:notes],
      category_id: params[:category],
      user_id: current_user.id
    )
    task.save
    task.update(icon: task.category.icon)
    redirect_to "/tasks/#{task.id}"
  end

  def show
    @task = Task.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @task = Task.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update(
      name: params[:task_name],
      length_time: params[:length_time],
      notes: params[:notes],
      category_id: params[:category],
      user_id: current_user.id
    )
    redirect_to "/tasks/#{task.id}"
  end

  def destroy
    task = Task.find_by(id: params[:id])
    task.destroy
    redirect_to '/tasks'
  end
end
