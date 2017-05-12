class AddUserId < ActiveRecord::Migration[5.0]
  def change
    add_column :user_preferences, :user_id, :integer
  end
end
