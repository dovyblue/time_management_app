class TimeManagementAppController < ApplicationController
  
  def about
  end
  
  def todays_tasks 
    @date = Date.today
    @day = Day.find_by(date: @date.to_s, user_id: current_user.id)
    if @day 
      @task_to_dos = TaskToDo.where(user_id: current_user.id, day_id: @day.id).order(:importance)
    else
      @day = Date.today
    end
    render 'todays_list.html.erb'
  end
end
