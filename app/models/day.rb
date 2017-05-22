class Day < ApplicationRecord
  has_many :task_to_dos
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true

  def add_drive_time
    Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=273 skillman st.brooklyn11205&destinations=150broadwaynyc&mode=driving&key=AIzaSyDcAOXEQJSshoopEIArsAAtGR7VOKw9DXo").body
  end

  def sorted_tasks
    time_btw_tasks = user.user_preferences[0].time_between
    day_st = Time.parse(start_time)
    day_et = Time.parse(end_time)
    total_time = 0 
    task_to_dos = TaskToDo.where(day_id: id)
    task_to_dos.each do |task|
      total_time += task.task.length_time + time_btw_tasks
    end
    day_time = (day_et - day_st).to_i.abs
    hrs_min =  day_time / 60
    min = day_time % 60
    day_time = hrs_min + min
    if total_time > day_time
      return "message"
    else
      task_to_dos = TaskToDo.where(day_id: id).order(:importance)
      tasks_sorted = []
      task_with_st = []
      task_with_et = []
      task_without_st = []
      task_to_dos.each do |task|
        if task.start_time != "" || nil
          task_with_st << task
        # elsif task.end_time != ""
        #   task_with_et << task
        else
          task_without_st << task
        end
      end
      # p "*" * 50
      # p task_with_st
      # p task_with_et
      # task_with_et.each do |task|
      #   et = Time.parse(task.end_time)
      #   st = et - (task.task.length_time * 60)
      #   task_td = TaskToDo.find_by(id: task.id)
      #   task_td.update(start_time: st.to_s)
      #   # p "*********"
      #   # p task_td
      #   task_with_st << task_td 
      # end
      # p task_with_st
      task_with_st.sort_by! { |task| task.start_time }
      task_with_st.each do |task|
        task_st = Time.parse(task.start_time)
        seconds_btw = (task_st - day_st).to_i.abs
        hour_minutes = (seconds_btw / 3600) * 60
        minutes = (seconds_btw % 3600) / 60
        time_btw = hour_minutes + minutes
        tasks_time = 0
        i = 0
        task_without_st.length.times do
          if task_without_st[i].task.length_time + tasks_time + time_btw_tasks <= time_btw
            tasks_sorted << task_without_st[i]
            tasks_time += task_without_st[i].task.length_time + time_btw_tasks
            task_without_st.delete(task_without_st[i])
          else
            i += 1
          end
        end
        tasks_sorted << task
        day_st = Time.parse(task.start_time) + (task.task.length_time * 60) + time_btw_tasks
      end
      task_without_st.each do |task|
        tasks_sorted << task 
      end
      # p tasks_sorted
      return tasks_sorted
    end
  end
end
