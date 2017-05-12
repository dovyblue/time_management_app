class UserPreference < ApplicationRecord
  belongs_to :user

  def create_tasks
    housework = Category.find_by(name: "Housework")
    personal = Category.find_by(name: "Personal")
    errands = Category.find_by(name: "Errands")
    miscellaneous = Category.find_by(name: "Miscellaneous")

    # Sweep Floors
    if speed == "fast"
      lt = 7
    elsif seed == "regular"
      lt = 10
    else
      lt = 15
    end
    task = Task.new(
      name: "Sweep Floors", 
      icon: bla,
      length_time: lt,
      user_id: current_user.id,
      category_id: miscellaneous.id
    )
    task.save
    # Fold Laundry
    if speed == "fast"
      lt = 12 
    elsif seed == "regular"
      lt = 20
    else
      lt = 30
    end
    task = Task.new(
      name: "Fold Laundry", 
      icon: bla,
      length_time: lt,
      user_id: current_user.id,
      category_id: miscellaneous.id
    )
    task.save
    # Wash Floors
    if speed == "fast"
      lt = 8  
    elsif seed == "regular"
      lt = 15
    else
      lt = 25
    end
    task = Task.new(
      name: "Wash Floors", 
      icon: bla,
      length_time: lt,
      user_id: current_user.id,
      category_id: miscellaneous.id
    )
    task.save
    # Dust Furniture  
    if speed == "fast"
      lt = 6  
    elsif seed == "regular"
      lt = 10
    else
      lt = 15
    end
    task = Task.new(
      name: "Dust Furniture ", 
      icon: bla,
      length_time: lt,
      user_id: current_user.id,
      category_id: miscellaneous.id
    )
    task.save
    # Check Mail 
    if speed == "fast"
      lt = 2  
    elsif seed == "regular"
      lt = 4
    else
      lt = 6
    end
    task = Task.new(
      name: "Check Mail", 
      icon: bla,
      length_time: lt,
      user_id: current_user.id,
      category_id: miscellaneous.id
    )
    task.save
    # Put Out Garbage 
    if speed == "fast"
      lt = 7  
    elsif seed == "regular"
      lt = 10
    else
      lt = 15
    end
    task = Task.new(
      name: "Put Out Garbage", 
      icon: bla,
      length_time: lt,
      user_id: current_user.id,
      category_id: miscellaneous.id
    )
    task.save
    # Shovel Snow 
    if speed == "fast"
      lt = 25 
    elsif seed == "regular"
      lt = 40
    else
      lt = 60
    end
    task = Task.new(
      name: "Shovel Snow", 
      icon: bla,
      length_time: lt,
      user_id: current_user.id,
      category_id: miscellaneous.id
    )
    task.save
    # Mow Lawn 
    if speed == "fast"
      lt = 25 
    elsif seed == "regular"
      lt = 35
    else
      lt = 45
    end
    task = Task.new(
      name: "Mow Lawn", 
      icon: bla,
      length_time: lt,
      user_id: current_user.id,
      category_id: miscellaneous.id
    )
    task.save
  end
end
