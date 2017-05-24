class TimeManagementAppController < ApplicationController
  
  def about
  end

  def about2
  end
  
  def todays_tasks 
    @time_btw = current_user.user_preferences[0].time_between
    @date = Date.today
    @day = Day.find_by(date: @date.to_s, user_id: current_user.id)
    unless @day 
      @day = Day.new(
        date: @date,
        start_time: current_user.user_preferences[0].default_start_time,
        end_time: current_user.user_preferences[0].default_end_time,
        user_id: current_user.id
      )
      @day.save
    end
    @task_to_dos = TaskToDo.where(user_id: current_user.id, day_id: @day.id).order(:importance)
    render 'todays_list.html.erb'
  end

  def update_task_duration
    task = Task.find_by(name: params[:name], user_id: current_user.id)
    timed_duration = params[:duration].to_i
    duration = (task.length_time + timed_duration) / 2
    task.update(length_time: duration)
    redirect_to "/todays-tasks"
  end
end
