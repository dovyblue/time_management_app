class TimeManagementAppController < ApplicationController
  def about
  end
  
  def todays_tasks 
    @date = Date.today
    
    @today = Day.find_by(date: @date, user_id: current_user.id)
    if @today 
      @tasks_to_do = TaskToDo.where(user_id: current_user.id, day_id: @today.id).order(:importance)
    else
      @today = Date.today
    end
    render 'todays_list.html.erb'
  end
end
