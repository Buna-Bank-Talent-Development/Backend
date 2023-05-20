class AddRoleToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :role, :string, null: false, default: 'employee'
  end
end
