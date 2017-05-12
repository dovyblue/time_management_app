class UserPreferencesController < ApplicationController
  before_action :authenticate_user!
  def new
    # form
  end
  
  def create
    # create preferences
    user_preference = UserPreference.new(
      user_id: current_user.id,
      default_start_time: params[:default_st],
      default_end_time: params[:default_et],
      speed: params[:speed],
      time_between: params[:time_between]
    )
    user_preference.save
    # create all tasks for user
    
    redirect_to "/????"
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end
end
