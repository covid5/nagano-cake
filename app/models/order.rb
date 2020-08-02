class Order < ApplicationRecord

	enum payment_method:{"クレジットカード": 0, "銀行振込": 1}

	belongs_to :member
	has_many :order_detail
	accepts_nested_attributes_for :order_detail

  attachment :image

  enum status: {"入金待ち" =>1, "入金確認" =>2, "制作中" =>3, "発送準備中" =>4, "発送済み" =>5}

  def total_amount
  	self.postage+self.member.cart.total_price.floor
  end


  def full_address
    self.post_code + self.address + self.address_name
  end

end
