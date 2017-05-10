class Day < ApplicationRecord
  has_many :task_to_dos
  validates :start_time, presence: true
  validates :end_time, presence: true

  def sorted_tasks
    task_to_dos = TaskToDo.where(day_id: id).order(:importance)
    tasks_sorted = []
    task_with_st = []
    task_without_st = []
    task_to_dos.each do |task|
      if task.start_time != ""
        task_with_st << task
      else
        task_without_st << task
      end
    end
    task_with_st.sort_by! { |task| task.start_time }
    day_st = Time.parse(start_time)
    task_with_st.each do |task|
      task_st = Time.parse(task.start_time)
      seconds_btw = (task_st - day_st).to_i.abs
      hour_minutes = (seconds_btw / 3600) * 60
      minutes = (seconds_btw % 3600) / 60
      time_btw = hour_minutes + minutes
      tasks_time = 0
      i = 0
      task_without_st.length.times do
        if task_without_st[i].task.length_time + tasks_time <= time_btw
          tasks_sorted << task_without_st[i]
          tasks_time += task_without_st[i].task.length_time
          task_without_st.delete(task_without_st[i])
        else
          i += 1
        end
      end
      tasks_sorted << task
      day_st = Time.parse(task.start_time) + (task.task.length_time * 60)
    end
    task_without_st.each do |task|
      tasks_sorted << task 
    end
    return tasks_sorted
  end
end
