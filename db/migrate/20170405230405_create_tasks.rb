class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :length_time
      t.text :notes
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
