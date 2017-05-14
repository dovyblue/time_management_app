class UserPreferencesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_preferences = UserPreference.find_by(user_id: current_user.id)
    p "*" * 50
    p @user_preferences
    render 'index.html.erb'
  end

  def new
  end
   
  def create
    user_preference = UserPreference.new(
      user_id: current_user.id,
      default_start_time: params[:default_st],
      default_end_time: params[:default_et],
      speed: params[:speed],
      time_between: params[:time_between]
    )
    if user_preference.save
      housework = Category.find_by(name: "Housework")
      personal = Category.find_by(name: "Personal")
      errands = Category.find_by(name: "Errands")
      miscellaneous = Category.find_by(name: "Miscellaneous")
      # Sweep Floors
      if user_preference.speed == "fast"
        lt = 7
      elsif user_preference.speed == "regular"
        lt = 10
      else
        lt = 15
      end
      task = Task.new(
        name: "Sweep Floors", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Fold Laundry
      if user_preference.speed == "fast"
        lt = 12 
      elsif user_preference.speed == "regular"
        lt = 20
      else
        lt = 30
      end
      task = Task.new(
        name: "Fold Laundry", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Strip linen
      if user_preference.speed == "fast"
        lt = 10
      elsif user_preference.speed == "regular"
        lt = 15
      else
        lt = 20
      end
      task = Task.new(
        name: "Strip linen", 
        icon: "fa fa-bed",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Wash Floors
      if user_preference.speed == "fast"
        lt = 8  
      elsif user_preference.speed == "regular"
        lt = 15
      else
        lt = 25
      end
      task = Task.new(
        name: "Wash Floors", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Dust Furniture  
      if user_preference.speed == "fast"
        lt = 6  
      elsif user_preference.speed == "regular"
        lt = 10
      else
        lt = 15
      end
      task = Task.new(
        name: "Dust Furniture ", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Check Mail 
      if user_preference.speed == "fast"
        lt = 2  
      elsif user_preference.speed == "regular"
        lt = 4
      else
        lt = 6
      end
      task = Task.new(
        name: "Check Mail", 
        icon: "fa fa-envelope",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Put Out Garbage 
      if user_preference.speed == "fast"
        lt = 7  
      elsif user_preference.speed == "regular"
        lt = 10
      else
        lt = 15
      end
      task = Task.new(
        name: "Put Out Garbage", 
        icon: "fa fa-trash",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Shovel Snow 
      if user_preference.speed == "fast"
        lt = 25 
      elsif user_preference.speed == "regular"
        lt = 40
      else
        lt = 60
      end
      task = Task.new(
        name: "Shovel Snow", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Mow Lawn 
      if user_preference.speed == "fast"
        lt = 25 
      elsif user_preference.speed == "regular"
        lt = 35
      else
        lt = 45
      end
      task = Task.new(
        name: "Mow Lawn", 
        icon: "fa fa-leaf",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Polish Silver 
      if user_preference.speed == "fast"
        lt = 30 
      elsif user_preference.speed == "regular"
        lt = 45
      else
        lt = 60
      end
      task = Task.new(
        name: "Polish Silver", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Wash Dishes 
      if user_preference.speed == "fast"
        lt = 10 
      elsif user_preference.speed == "regular"
        lt = 15
      else
        lt = 20
      end
      task = Task.new(
        name: "Wash Dishes", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Prepare Breakfast 
      if user_preference.speed == "fast"
        lt = 4 
      elsif user_preference.speed == "regular"
        lt = 8
      else
        lt = 15
      end
      task = Task.new(
        name: "Prepare Breakfast", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Prepare Lunch 
      if user_preference.speed == "fast"
        lt = 5 
      elsif user_preference.speed == "regular"
        lt = 10
      else
        lt = 15
      end
      task = Task.new(
        name: "Prepare Lunch", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Cook Dinner 
      if user_preference.speed == "fast"
        lt = 30 
      elsif user_preference.speed == "regular"
        lt = 50
      else
        lt = 90
      end
      task = Task.new(
        name: "Cook Dinner", 
        icon: "fa fa-home",
        length_time: lt,
        user_id: current_user.id,
        category_id: housework.id
      )
      task.save
      # Get Dressed 
      if user_preference.speed == "fast"
        lt = 5 
      elsif user_preference.speed == "regular"
        lt = 10
      else
        lt = 15
      end
      task = Task.new(
        name: "Get Dressed", 
        icon: "glyphicon glyphicon-user",
        length_time: lt,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Shower 
      if user_preference.speed == "fast"
        lt = 10
      elsif user_preference.speed == "regular"
        lt = 14
      else
        lt = 18
      end
      task = Task.new(
        name: "Shower", 
        icon: "glyphicon glyphicon-user",
        length_time: lt,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Go To Work                          ????????????????????????
      if user_preference.speed == "fast"
        lt = 10
      elsif user_preference.speed == "regular"
        lt = 14
      else
        lt = 18
      end
      task = Task.new(
        name: "Go To Work", 
        icon: "fa fa-briefcase",
        length_time: lt,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Breakfast 
      if user_preference.speed == "fast"
        lt = 7  
      elsif user_preference.speed == "regular"
        lt = 13
      else
        lt = 25
      end
      task = Task.new(
        name: "Breakfast", 
        icon: "fa fa-cutlery",
        length_time: lt,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Lunch 
      if user_preference.speed == "fast"
        lt = 15  
      elsif user_preference.speed == "regular"
        lt = 30
      else
        lt = 45
      end
      task = Task.new(
        name: "Lunch", 
        icon: "fa fa-cutlery",
        length_time: lt,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Dinner 
      if user_preference.speed == "fast"
        lt = 20   
      elsif user_preference.speed == "regular"
        lt = 35
      else
        lt = 60
      end
      task = Task.new(
        name: "Dinner", 
        icon: "fa fa-cutlery",
        length_time: lt,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Morning Prayers 
      task = Task.new(
        name: "Morning Prayers", 
        icon: "fa fa-book",
        length_time: 50,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Noontime Prayers 
      task = Task.new(
        name: "Noontime Prayers", 
        icon: "fa fa-book",
        length_time: 15,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Evening Prayers 
      task = Task.new(
        name: "Evening Prayers", 
        icon: "fa fa-book",
        length_time: 15,
        user_id: current_user.id,
        category_id: personal.id
      )
      task.save
      # Coffee Shop 
      task = Task.new(
        name: "Coffee Shop", 
        icon: "fa fa-shopping-bag",
        length_time: 4,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Supermarket 
      task = Task.new(
        name: "Supermarket", 
        icon: "glyphicon glyphicon-apple",
        length_time: 20,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Bakery 
      task = Task.new(
        name: "Bakery", 
        icon: "fa fa-shopping-bag",
        length_time: 10,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Butcher 
      task = Task.new(
        name: "Butcher", 
        icon: "fa fa-shopping-bag",
        length_time: 8,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Fish Store 
      task = Task.new(
        name: "Fish Store", 
        icon: "fa fa-shopping-bag",
        length_time: 10,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Carpool Kids 
      task = Task.new(
        name: "Carpool Kids", 
        icon: "fa fa-child",
        length_time: 20,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Doctor Appointment 
      task = Task.new(
        name: "Doctor Appointment", 
        icon: "fa fa-stethoscope",
        length_time: 30,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Dentist Appointment 
      task = Task.new(
        name: "Dentist Appointment", 
        icon: "fa fa-shopping-bag",
        length_time: 30,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Pharmacy 
      task = Task.new(
        name: "Pharmacy", 
        icon: "fa fa-shopping-bag",
        length_time: 10,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Bank 
      task = Task.new(
        name: "Bank", 
        icon: "fa fa-bank",
        length_time: 10,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Laundromat 
      task = Task.new(
        name: "Laundromat", 
        icon: "fa fa-shopping-bag",
        length_time: 90,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Clothing Store 
      task = Task.new(
        name: "Clothing Store", 
        icon: "fa fa-shopping-bag",
        length_time: 25,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Shoe Store 
      task = Task.new(
        name: "Shoe Store", 
        icon: "fa fa-shopping-bag",
        length_time: 20,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Flowers Shop 
      task = Task.new(
        name: "Flowers Shop", 
        icon: "fa fa-shopping-bag",
        length_time: 10,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Library 
      task = Task.new(
        name: "Library", 
        icon: "fa fa-book",
        length_time: 45,
        user_id: current_user.id,
        category_id: errands.id
      )
      task.save
      # Car Wash 
      task = Task.new(
        name: "Car Wash", 
        icon: "fa fa-car",
        length_time: 25,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Gas 
      task = Task.new(
        name: "Gas", 
        icon: "fa fa-car",
        length_time: 8,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Wait for Kids Bus 
      task = Task.new(
        name: "Wait for Kids Bus", 
        icon: "fa fa-bus",
        length_time: 6,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Pick Up Baby 
      task = Task.new(
        name: "Pick Up Baby", 
        icon: "fa fa-child",
        length_time: 10,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Walk Dog 
      task = Task.new(
        name: "Walk Dog", 
        icon: "glyphicon glyphicon-pushpin",
        length_time: 25,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Pay Bills 
      task = Task.new(
        name: "Pay Bills", 
        icon: "fa fa-credit-card",
        length_time: 10,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Hair Dresser 
      task = Task.new(
        name: "Hair Dresser", 
        icon: "glyphicon glyphicon-pushpin",
        length_time: 30,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Manicure 
      task = Task.new(
        name: "Manicure", 
        icon: "glyphicon glyphicon-pushpin",
        length_time: 30,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Barber Shop 
      task = Task.new(
        name: "Barber Shop", 
        icon: "glyphicon glyphicon-pushpin",
        length_time: 30,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Park/ Garden 
      task = Task.new(
        name: "Park/ Garden", 
        icon: "fa fa-tree",
        length_time: 45,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Freelance Work 
      task = Task.new(
        name: "Freelance Work", 
        icon: "glyphicon glyphicon-pushpin",
        length_time: 60,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Music Lessons 
      task = Task.new(
        name: "Music Lessons", 
        icon: "fa fa-music",
        length_time: 45,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Art Lessons 
      task = Task.new(
        name: "Art Lessons", 
        icon: "fa fa-paint-brush",
        length_time: 60,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Ballet Class 
      task = Task.new(
        name: "Ballet Class", 
        icon: "glyphicon glyphicon-pushpin",
        length_time: 90,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Gym Workout 
      task = Task.new(
        name: "Gym Workout", 
        icon: "glyphicon glyphicon-pushpin",
        length_time: 30,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      # Morning Walk 
      task = Task.new(
        name: "Morning Walk", 
        icon: "glyphicon glyphicon-pushpin",
        length_time: 30,
        user_id: current_user.id,
        category_id: miscellaneous.id
      )
      task.save
      redirect_to "/tasks"
    else 
      @errors = user_preference.errors.full_messages
      render "new.html.erb"
    end
  end

  def edit
    @user_preferences = UserPreference.find_by(user_id: params[:user_id])
    render 'edit.html.erb'
  end

  def update
    user_preference = UserPreference.update(
      default_start_time: params[:default_st],
      default_end_time: params[:default_et],
      time_between: params[:time_between]
    )
    redirect_to "/user-preferences"
  end
end
