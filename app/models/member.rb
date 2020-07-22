class Member < ApplicationRecord

	enum status: { 有効:false, 退会済み:true }
  
	has_many :orders
  has_many :shipping_addresses, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end