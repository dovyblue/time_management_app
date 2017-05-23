class AddDepartureTimeToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :task_to_dos, :going_time, :integer
    add_column :task_to_dos, :coming_time, :integer
  end
end
