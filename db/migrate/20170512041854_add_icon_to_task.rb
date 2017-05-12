class AddIconToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :icon, :string
  end
end
