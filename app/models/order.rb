class Order < ApplicationRecord

	belongs_to :member
	has_many :order_detail

attachment :image

enum status: {"入金待ち" =>1, "入金確認" =>2, "制作中" =>3, "発送準備中" =>4, "発送済み" =>5}

end
