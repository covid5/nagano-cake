class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :postal_code, :string
    add_column :orders, :address, :string
    add_column :orders, :address_name, :string
    add_column :orders, :status, :integer
  end
end
