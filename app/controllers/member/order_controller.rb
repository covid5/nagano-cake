class Member::OrderController < ApplicationController
	def index
		@order = Order.all
	end

	def show
	end

end
