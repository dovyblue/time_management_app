class TaskToDosController < ApplicationController
  before_action :authenticate_user!
  def new
    # @task is temperedy
    @tasks = Task.where(user_id: [nil, current_user.id])
    @categories = Category.all
    @date = params[:date]
    render 'new.html.erb'
  end

  def create
    day = Day.find_by(date: params[:date], user_id: current_user.id)
    tasks = params[:tasks]
    tasks.each do |task|
      task_to_do = TaskToDo.new(
        day_id: day.id,
        user_id: current_user.id,
        task_id: task
      )
      task_to_do.save
    end
    redirect_to "/#{day.date}/task-to-dos/edit"
  end

  def edit
    @day = Day.find_by(date: params[:date], user_id: current_user.id)
    @tasks_to_do = TaskToDo.where(day_id: @day.id, user_id: current_user.id)
    render 'edit.html.erb'
  end

  def update
    tasks = params[:tasks]
    tasks.each do |task_id, atr|
      task_td = TaskToDo.find_by(id: task_id)
      if atr['custom_duration'] == ""
        task_custom_duration = task_td.task.length_time
      else
        task_custom_duration = atr['custom_duration']
      end
      task_td.update(
        start_time: atr['start_time'],
        end_time: atr['end_time'],
        importance: atr['importance'],
        custom_duration: task_custom_duration,
        departure: atr['departure'],
        destination: atr['destination'],
        drive_mode: atr['drive_mode']
      )
    end
    day = Day.find_by(date: params[:date], user_id: current_user.id)
    day.update(
      start_time: params[:day_start_t],
      end_time: params[:day_end_t]
    )
    redirect_to "/days/#{day.date}"
  end

  def destroy
    task_to_do = TaskToDo.find_by(id: params[:id])
    task_to_do.destroy
  end
end
