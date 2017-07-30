class AddRoleToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :role, :integer, default: 0
  end
end
