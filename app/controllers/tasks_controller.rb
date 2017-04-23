class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.where(user_id: [nil, current_user.id])
    render 'index.html.erb'
  end
end
