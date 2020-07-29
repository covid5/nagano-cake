module ApplicationHelper
	def taxed_price(price)
		price = price * 1.1
		price.floor
	end

end
