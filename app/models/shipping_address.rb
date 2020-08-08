class ShippingAddress < ApplicationRecord
	belongs_to :member
	validates :post_code, presence: true
	validates :address ,presence: true
	validates :address_name ,presence: true

	def full_address
		self.post_code + self.address + self.address_name
	end
end
