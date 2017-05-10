class ChangeDateToString < ActiveRecord::Migration[5.0]
  def change
    change_column :days, :date, :string
  end
end
