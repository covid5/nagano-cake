class Member::CartProductsController < ApplicationController
	before_action :set_cart_product!, only: [:add_item, :update_item, :delete_item, :empty_item]

	def show
		@cart_items = current_member.cart_product
	end

	def add_item
		if @cart_product.blank?
			@cart_item = current_member.cart_product.build(product_id: params[:product_id])
		end

		@cart_product.number += params[:number].to_i
		@cart_product.save
		redirect_to ''
	end

	def update_item
		@cart_product.number += params[:number].to_i
		redirect_to ''
	end

	def delete_item
		@cart_product.destroy
		redirect_to ''
	end

	def empty_item
		@cart_product.destroy_all
		redirect_to ''
	end

	private

	def set_cart_product
		@cart_item = current_member.cart_product.find_by(product_id: params[:product_id])
	end
end
