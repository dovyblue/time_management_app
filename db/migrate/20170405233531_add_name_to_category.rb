class AddNameToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :category, :name, :string
  end
end
