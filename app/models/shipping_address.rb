class ShippingAddress < ApplicationRecord
	belongs_to :member
	validates :post_code, presence: true
	validates :address ,presence: true
	validates :address_name ,presence: true
end
