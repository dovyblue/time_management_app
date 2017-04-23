class DropCategory < ActiveRecord::Migration[5.0]
  def change
    drop_table :category
  end
end
