class CreateUserPreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :user_preferences do |t|
      t.string :default_start_time
      t.string :default_end_time
      t.string :speed
      t.integer :time_between

      t.timestamps
    end
  end
end
