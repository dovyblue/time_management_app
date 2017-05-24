class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all
    render 'index.html.erb'
  end
end
