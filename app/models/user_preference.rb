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
    elsif speed == "regular"
      lt = 10
    else
      lt = 15
    end
    task = Task.new(
      name: "Sweep Floors", 
      icon: "bla",
      length_time: lt,
      user_id: current_user.id,
      category_id: housework.id
    )
    task.save
    
  end
end
