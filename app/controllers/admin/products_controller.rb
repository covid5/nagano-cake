class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def new
    @product_new = Product.new
    @genres = Genre.where.not(disabled: "true")
  end

  def create
    @product_new = Product.new(product_params)
    if @product_new.save
       redirect_to admin_product_path(@product_new), notice: "登録されました"
     else
      @genres = Genre.where.not(disabled: "true")
      render 'new', notice: "空欄はありませんか？"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.where.not(disabled: "true")
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       redirect_to admin_product_path(@product), notice: "更新されました"
     else
      @genres = Genre.where.not(disabled: "true")
      render 'edit', notice: "空欄はありませんか？"
    end
  end



  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :genre_id, :price, :salling_status)
  end

end
