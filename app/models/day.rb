class Day < ApplicationRecord
  has_many :task_to_dos
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true

  def add_drive_time
    tasks = TaskToDo.where(day_id: id)
    tasks.each do |task|
      if task.destination != ""
        dprt = task.departure
        dest = task.destination
        d_mode = task.drive_mode
        going = Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{dprt}&destinations=#{dest}&mode=#{d_mode}&key=#{ENV['API_KEY']}").body 
        p "*" * 50
        p going
        duration_text = going['rows'][0]['elements'][0]['duration']['text'].split
        going_time = 0
        if duration_text.length == 4
          hrs_min = duration_text[0].to_i * 60
          min = duration_text[2].to_i 
          going_time = hrs_min + min
        else
          going_time = duration_text[0].to_i
        end
        task.update(going_time: going_time)
        # coming = Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{dest}&destinations=#{dprt}&mode=#{d_mode}&key=#{ENV['API_KEY']}").body
        # p coming
      end
    end 
  end

  def sorted_tasks
    add_drive_time
    # -----------------
    time_btw_tasks = user.user_preferences[0].time_between
    day_st = Time.parse(start_time)
    day_et = Time.parse(end_time)
    total_time = 0 
    task_to_dos = TaskToDo.where(day_id: id)
    task_to_dos.each do |task|
      t_length_time = 0
      if task.going_time == nil
        t_length_time = task.custom_duration
      else
        t_length_time = task.custom_duration + (task.going_time * 2)
      end
      total_time += t_length_time + time_btw_tasks
    end
    day_time = (day_et - day_st).to_i.abs
    hrs_min =  day_time / 60
    min = day_time % 60
    day_time = hrs_min + min
    if total_time > day_time
      return "message"
    # -----------------
    else
      task_to_dos = TaskToDo.where(day_id: id).order(:importance)
      tasks_sorted = []
      task_with_st = []
      task_with_et = []
      task_without_st = []
      task_to_dos.each do |task|
        if task.end_time && task.end_time != ""
          task_with_et << task
        elsif task.start_time && task.start_time != ""
          task_with_st << task
        else
          task_without_st << task
        end
      end
      task_with_et.each do |task|
        et = Time.parse(task.end_time)
        st = et - (task.custom_duration * 60)
        task_td = TaskToDo.find_by(id: task.id)
        st = st.strftime("%H:%M")
        task_td.update(start_time: st.to_s)
        task_with_st << task_td 
      end
      task_with_st.sort_by! { |task| task.start_time }
      # -----------------
      error = false
      count = 1
      task_with_st.each do |task|
        first_task_st = Time.parse(task.start_time)
        first_task_total = first_task_st + (task.custom_duration * 60) + (time_btw_tasks * 60)
        if task.going_time
          first_task_st = first_task_st - (task.going_time * 60)
          first_task_total = first_task_total + (task.going_time * 60)
        end
        if task == task_with_st[0]
          if first_task_st < day_st
            error = true
            break
          end
        end
        if task_with_st[count]
          second_task_st = Time.parse(task_with_st[count].start_time)
          if task_with_st[count].going_time
            second_task_st = second_task_st - (task_with_st[count].going_time * 60)
          end
          if second_task_st < first_task_total
            error = true
            break
          end
        end
        count += 1
      end
      if error
        return "message 2"
      # -----------------
      else
        task_with_st.each do |task|
          task_st = Time.parse(task.start_time)
          if task.going_time
            task_st = task_st - (task.going_time * 60)
          end
          seconds_btw = (task_st - day_st).to_i.abs
          hour_minutes = (seconds_btw / 3600) * 60
          minutes = (seconds_btw % 3600) / 60
          time_btw = hour_minutes + minutes
          # p day_st
          # p task_st
          tasks_time = 0
          i = 0
          task_without_st.length.times do
            t_length_time = 0
            if task_without_st[i].going_time 
              t_length_time = task_without_st[i].custom_duration + (task_without_st[i].going_time * 2)
            else
              t_length_time = task_without_st[i].custom_duration
            end
            if t_length_time + tasks_time + time_btw_tasks <= time_btw
              tasks_sorted << task_without_st[i]
              p tasks_time += t_length_time + time_btw_tasks
              task_without_st.delete(task_without_st[i])
            else
              i += 1
            end
          end
          tasks_sorted << task
          tst_length_time = 0
          if task.going_time == nil
            tst_length_time = task.custom_duration
          else
            tst_length_time = task.custom_duration + task.going_time
          end
          day_st = Time.parse(task.start_time) + (tst_length_time * 60) + (time_btw_tasks * 60)
        end
        # -----------------
        task_without_st.each do |task|
          tasks_sorted << task 
        end
        return tasks_sorted
      end
    end
  end
end