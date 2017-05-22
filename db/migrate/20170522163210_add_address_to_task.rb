class AddAddressToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :task_to_dos, :departure, :string
    add_column :task_to_dos, :destination, :string
    add_column :task_to_dos, :drive_mode, :string
  end
end
