class Cart < ApplicationRecord
	has_many :cart_products, dependent: :destroy
	has_many :products, through: :cart_products

	def total_price
		cart_products.to_a.sum { |product| product.sum_price }
	end


end
