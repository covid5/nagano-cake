class Order < ApplicationRecord
  enum payment_method:{credit_card: 0, bank_transfer: 1}

	belongs_to :member
	has_many :order_detail

  def full_address
    self.post_code + self.address + self.address_name
  end
  
attachment :image

enum status: {"入金待ち" =>1, "入金確認" =>2, "制作中" =>3, "発送準備中" =>4, "発送済み" =>5}

end
