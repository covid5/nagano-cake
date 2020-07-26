class Member < ApplicationRecord

	enum status: { 有効:false, 退会済み:true }
	has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy

  def prepare_cart
  	current_member.cart || current_member.create_cart
  end

end
