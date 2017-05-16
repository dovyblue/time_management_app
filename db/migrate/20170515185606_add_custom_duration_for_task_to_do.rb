class AddCustomDurationForTaskToDo < ActiveRecord::Migration[5.0]
  def change
    add_column :task_to_dos, :custom_duration, :integer
  end
end
