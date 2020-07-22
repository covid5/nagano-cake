class Member::ShippingAddressesController < ApplicationController
	before_action :authenticate_member!
	before_action :ensure_correct_member, only: [:edit, :update, :destroy]

	def index
		@shipping_addresses = ShippingAddress.where(member_id: current_member.id)
		@shipping_address = ShippingAddress.new

	end

	def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.member_id = current_member.id
		@shipping_address.save
	    redirect_to :action => 'index'
	end

	def edit
	end

	def update
		@shipping_address.update(shipping_address_params)
		redirect_to :action => 'index'
	end

	def destroy
		@shipping_address.destroy
		redirect_to :action => 'index'
	end

	private

	def shipping_address_params
		params.require(:shipping_address).permit(:member_id, :post_code, :address, :address_name)
	end

	def ensure_correct_member
		@shipping_address = ShippingAddress.find(params[:id])
		unless @shipping_address.member == current_member
			redirect_to root_path
		end
	end
end
