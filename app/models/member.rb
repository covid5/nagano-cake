class Member < ApplicationRecord

	enum status: { 有効:false, 退会済み:true }

	has_many :orders
  has_many :shipping_addresses, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


 def full_address
		self.post_code + self.address + self.last_name + self.first_name
	end

  has_one :cart, dependent: :destroy

  def prepare_cart
  	current_member.cart || current_member.create_cart
  end

  def active_for_authentication?
    super && (self.status? == 有効?)
  end

  def inactive_message
   "退会済みです"
 end

end
