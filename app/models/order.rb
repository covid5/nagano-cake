class Order < ApplicationRecord
  enum payment_method:{credit_card: 0, bank_transfer: 1}

	belongs_to :member
	has_many :order_detail

  attachment :image

  def full_address
    self.post_code + self.address + self.address_name
  end

end
