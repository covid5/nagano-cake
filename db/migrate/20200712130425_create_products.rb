class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image_id
      t.integer :salling_status

      t.timestamps
    end
  end
end
