class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :email
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.string :encrypted_password
      t.boolean :status, null: false,default: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
