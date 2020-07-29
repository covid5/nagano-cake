class Member::CartProductsController < ApplicationController

private
	def cart_product_params
		params.require(:cart_product).permit(:cart_id, :product_id, :number)
	end
end
