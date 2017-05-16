class Api::V1::TasksController < ApplicationController
 
  def index
    @user_id = params[:userId]
    @categories = Category.all
    render 'index.json.jbuilder'
  end

  def create
    @categories = Category.all
    @user_id = params[:userId]
    task = Task.new(
      name: params[:name],
      length_time: params[:lengthTime],
      user_id: params[:userId],
      category_id: params[:categoryId]
    )
    task.save
    task.update(icon: task.category.icon)
    render "index.json.jbuilder"
  end
end


