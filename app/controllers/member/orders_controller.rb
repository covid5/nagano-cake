class Member::OrdersController < ApplicationController
  before_action :set_member
  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.all
  end

  def confirm
    @order = Order.new(order_params)
    @cart_products = CartProduct.where(cart_id: current_member.cart.id)
    @cart = current_member.cart
    if @order.address_option == 0
      @order.postal_code = current_member.post_code
      @order.address = current_member.address
      @order.address_name = current_member.last_name
    elsif @order.address_option == 1
      @shipping_addresses = ShippingAddress.find(params[:select_address])
      @order.postal_code = @shipping_addresses.post_code
      @order.address = @shipping_addresses.address
      @order.address_name = @shipping_addresses.address_name
    end
    # render :new and return if params[:back] || !@order.save
    
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_products = CartProduct.where(cart_id: current_member.cart.id)
    @cart_products.each do |cp|
      @order_detail = @order.order_detail.new
      @order_detail.product_id = cp.product.id
      @order_detail.number = cp.number
    @order_detail.save
    current_member.cart.cart_products.destroy_all
    end
    redirect_to member_orders_thank_path
  end

  def thank
  end


  def index
		@orders = Order.where(member_id: current_member.id)
    #@orders = @member.orders
	end

	def show
    @order = Order.find_by(id: params[:id])
    @order_details = @order.order_detail
  end


  private
  def set_member
    @member = current_member
  end
  def order_params
    params.permit(
      :postage,
      :payment_method,
      :total_amount,
      :postal_code,
      :address,
      :address_name,
      :address_option,
      order_detail_attributes: [:id,
                                :product_id,
                                :product_name,
                                :order_id,
                                :number,
                                :taxed_price,
                                :production_status]
    ).merge(member_id: current_member.id)

  end
end
