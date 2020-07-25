class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :postage
      t.integer :peyment_method
      t.integer :total_amount

      t.timestamps
    end
  end
end
