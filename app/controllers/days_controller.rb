class DaysController < ApplicationController
  before_action :authenticate_user!
  def index
    render 'index.html.erb'
  end

  def create
    day = Day.new(
      date: params[:date],
      start_time: params[:start_time],
      end_time: params[:end_time],
      user_id: current_user.id
    )
    if day.save
      redirect_to "/days/#{params[:date]}"
    else
      @date = params[:date] 
      @errors = day.errors.full_messages
      render 'new.html.erb'
    end
  end

  def show
    @day = Day.find_by(date: params[:date], user_id: current_user.id)
    if @day == nil
      @date = params[:date] 
      render 'new.html.erb'
    else
      @task_to_dos = TaskToDo.where(day_id: @day.id, user_id: current_user.id).order(:importance)
      render 'show.html.erb'
    end
  end
  
end


