class Order < ApplicationRecord

	belongs_to :member
	has_many :order_detail

attachment :image

end
