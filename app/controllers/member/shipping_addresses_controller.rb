class Member::ShippingAddressesController < ApplicationController
	#before_action :auyhenicate_user!

	def index
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def shipping_addresses
		params.require(:shipping_address).permit(:member_id, :post_code, :address, :address_name,)
end
