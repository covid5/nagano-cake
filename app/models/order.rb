class Order < ApplicationRecord

	belongs_to :member
	has_many :order_detail

attachments :profile_image

end
