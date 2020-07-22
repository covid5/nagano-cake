class Admin::OrdersController < ApplicationController
  def index
  	path = Rails.application.routes.recognize_path(request.referer)
  	path_controller = path[:controller]
  	path_action = path[:action]

  	if path_controller == "admin/homes" && path_action == "top"
  	  @orders = Order.where("created_at: >=?", Time.zone.now.beginning_of_day).page(params[:page]).reverse_order
	elsif path_controller == "admin/member" && path_action == "show"
	  @orders = Member.find(params[:id]).orders.page(params[:page]).reverse_order
	else @orders = Order.all.page(params[:page]).reverse_order
	end
end

  def show
  end
end
