class ChangeTableNameForName < ActiveRecord::Migration[5.0]
  def change
    rename_table :names, :category
    
  end
end
