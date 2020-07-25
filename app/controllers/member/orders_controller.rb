class Member::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    return if @order.valid?
    render :new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to 'member_orders_confirm_path	'
  end

  def thank
  end

  private
  def order_params
    params.permit(:postage, :peyment_method, :total_amount)
  end
end
