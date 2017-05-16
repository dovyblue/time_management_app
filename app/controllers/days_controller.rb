class DaysController < ApplicationController
  before_action :authenticate_user!
  def index
    render 'index.html.erb'
  end

  def create
    date = Date.parse(params[:date])
    day = Day.find_by(date: date, user_id: current_user.id)
    if day == nil
      day = Day.new(
        date: date,
        start_time: current_user.user_preferences[0].default_start_time,
        end_time: current_user.user_preferences[0].default_end_time,
        user_id: current_user.id
      )
      day.save
    end
    redirect_to "/days/#{day.date}"
  end

  def show
    @day = Day.find_by(date: params[:date], user_id: current_user.id)
    @task_to_dos = TaskToDo.where(day_id: @day.id, user_id: current_user.id)
    render 'show.html.erb'
  end
 
end


