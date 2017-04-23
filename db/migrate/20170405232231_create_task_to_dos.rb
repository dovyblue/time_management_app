class CreateTaskToDos < ActiveRecord::Migration[5.0]
  def change
    create_table :task_to_dos do |t|
      t.integer :user_id
      t.integer :day_id
      t.integer :task_id
      t.time :start_time
      t.time :end_time
      t.string :importance

      t.timestamps
    end
  end
end
