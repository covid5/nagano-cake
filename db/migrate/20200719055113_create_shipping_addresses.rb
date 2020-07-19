class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :member_id
      t.string :post_code
      t.string :adress
      t.string :adress_name

      t.timestamps
    end
  end
end
