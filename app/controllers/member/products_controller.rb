class Member::ProductsController < ApplicationController
	before_action :authenticate_member!
	def index
		@genres = Genre.where.not(disabled: "true")
		if params[:genre_id]
		@products = Product.where(genre_id: params[:genre_id]).page(params[:page]).reverse_order
		@genre = Genre.find_by(id: params[:genre_id])
	  else
		@products = Product.page(params[:page]).reverse_order
	    end
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
	end
end
