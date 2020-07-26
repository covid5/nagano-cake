class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.string :postal_code
      t.string :address
      t.string :address_name
      t.integer :status
      t.integer :postage
      t.integer :payment_method
      t.integer :total_amount
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end