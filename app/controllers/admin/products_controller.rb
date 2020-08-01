class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.page(params[:page]).per(10) # 追加
    @genres = Genre.all
  end

  def new
    @product_new = Product.new
    # 修正
    @genres = Genre.where.not(disabled: "true")
  end

  def create
    @product_new = Product.new(product_params)
    @product_new.save
    #修正
    redirect_to admin_product_path(@product_new), notice: "登録されました"
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.where.not(disabled: "true") #修正
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    #修正
    redirect_to admin_product_path(@product), notice: "更新されました"
  end



  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :genre_id, :price, :salling_status)
  end

end
