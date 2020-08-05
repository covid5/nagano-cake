class Admin::OrderDetailsController < ApplicationController
  def update
  	check = 0
  	@order = Order.find(params[:id])
  	@order_detail = OrderDetail.find(params[:id])
  	@order_detail.update(order_detail_params)
  	@order_details = @order.order_detail
    @order_details.update(order_detail_params)
  	@order_details.each do |order_detail|
      @order_status = order_detail.order
  		if order_detail.production_status == "製作中"
  			@order_status.update(status: "製作中")
  		# elsif order_detail.production_status == "製作完了"
  		# 	check += 1
  		# else check == @order_details.count
  		# 	order_detail.order.update(status: "発送準備中")
  		end
  	end
    redirect_to request.referer
  end

  private
  def order_params
  	params.require(:order).permit(:status)
  end
  def order_detail_params
  	params.require(:order_detail).permit(:production_status)
  end
end
