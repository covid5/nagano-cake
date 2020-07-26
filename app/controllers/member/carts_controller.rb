class Member::CartsController < ApplicationController
	before_action :authenticate_member!

	def index
		@cart = current_member.cart || current_member.create_cart
		@cart_products = CartProduct.where(cart_id: current_member.cart.id)
	end

	def create
		@cart_product = CartProduct.new(cart_product_params)
		cart = current_member.cart || current_member.create_cart
		@cart_product.cart_id = current_member.cart.id
		@cart_products = CartProduct.where(cart_id: current_member.cart.id)
		@cart_products.each do |cart_product|
			if cart_product.product_id == @cart_product.product_id
				new_number = cart_product.number + @cart_product.number
				cart_product.update_attribute(:number, new_number)
				@cart_product.delete
			end
		end
		@cart_product.save
		redirect_to :action => 'index'
	end

	def update
		@cart_product = CartProduct.find(params[:id])
		@cart_product.update(cart_product_params)
		redirect_to request.referer
	end

	def destroy
	 	@cart_product = CartProduct.find(params[:id])
	 	@cart_product.destroy
	 	redirect_to request.referer
	end

	def empty_item
		@cart_products = CartProduct.where(cart_id: current_member.cart.id)
		@cart_products.destroy_all
		redirect_to request.referer
	end

	private
	def cart_product_params
		params.require(:cart_product).permit(:cart_id, :product_id, :number)
	end


end
