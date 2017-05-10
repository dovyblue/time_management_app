class ChangeTaskToDoTimeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :task_to_dos, :start_time, :string
    change_column :task_to_dos, :end_time, :string
  end
end
