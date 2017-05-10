class ChangeTimeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :days, :start_time, :string
    change_column :days, :end_time, :string
  end
end
