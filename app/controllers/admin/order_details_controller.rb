class Admin::OrderDetailsController < ApplicationController
  def update
  	check = 0
  	@order_detail = OrderDetail.find(params[:id])
  	@order_detail.update(order_detail_params)
    @order = @order_detail.order
  		if @order_detail.production_status == "製作中"
  			@order.update(status: "製作中")
      end
    @order_details = @order.order_detail
      @order_details.each do |order_detail|
    		if order_detail.production_status == "製作完了"
    			check += 1
        else
          check += 0
        end
        if check == @order_details.count
    			@order.update(status: "発送準備中")
        end
  	  end
    redirect_to request.referer
  end

  private
  def order_detail_params
  	params.require(:order_detail).permit(:production_status)
  end
end
