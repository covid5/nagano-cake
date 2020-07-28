class Member::OrdersController < Member::ApplicationController
  def new
    @order = Order.new
    @shipping_addresses = ShippingAddress.all

  end

  def confirm
    @order = Order.new(order_params)
    render :new if @order.valid?
  end

  def create
    @order = Order.new(order_params)
    render :new and return if params[:back] || !@order.save
    redirect_to thank_path
  end

  def thank
  end


  def index
		@order = Order.all
	end

	def show
	end




  private
  def order_params
    params.permit(:postage, :peyment_method, :total_amount)
  end
end
