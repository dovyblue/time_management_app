class AddHomeToPreferences < ActiveRecord::Migration[5.0]
  def change
    add_column :user_preferences, :home, :string
  end
end
