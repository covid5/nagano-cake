
class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!
  def index
  	path = Rails.application.routes.recognize_path(request.referer)
  	path_controller = path[:controller]
  	path_action = path[:action]

  # topページから遷移　＝＞　当日注文の注文履歴
  	if path_controller == "admin/homes" && path_action == "top"
  	  @orders = Order.where(created_at: Time.zone.now.beginning_of_day).page(params[:page]).reverse_order

  	  # 会員詳細からの遷移　＝＞　該当顧客の注文履歴
	elsif path_controller == "admin/member" && path_action == "show"
	  @orders = Member.find(params[:id]).orders.page(params[:page]).reverse_order

	  # ヘッダーからの遷移　＝＞　全顧客の注文履歴
	else @orders = Order.all.page(params[:page]).reverse_order
	end
  end

  def show
  	@order = Order.find(params[:id])
  	@order_details = @order.order_details
  end

  def update
  	@order = Order.find(params[:id])
  	@order.update(order_params)
  	if @oreder.status == "入金確認"
  		@order.order_details.each do |order_detail|
  			order_detail.update(production_status: "製作待ち")
  		end
  	end
  	redirect_to request.referer(@order)
  end

  # def update_products
  # 	@product = OrderDetail.find(params[:id])
  # 	@product.update(order_detail_params)
  # end

  private

  def order_params
  	params.require(:order).permit(:order_status)
  end

  # def order_detail_params
  # 	params.require(:order_detail).permit(:production_status)
  # end

end



