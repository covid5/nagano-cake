class Admin::OrdersController < ApplicationControlle
before_action :set_order, only: [:show, :update_order, :update_produtcts]
  
  def index

    @orders = Order.pagenate :page=>params[:page],  :per_page =>10

	respond_to do |format|
		format.html
		format.json { render json: @orders }
	end

  end

end

 def show
 	
 end
  def update_order
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: '注文情報を更新しました。' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  def update_produtcts
  end


