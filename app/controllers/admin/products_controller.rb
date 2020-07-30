class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
    @genres = Genre.all
  end

  def new
    @product_new = Product.new
    @genres = Genre.where.not(disabled: "true")
  end

  def create
    @product_new = Product.new(product_params)
    @product_new.save
    redirect_to :action => 'index'
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
    @product.update(product_params)
    redirect_to :action => 'show'
  end



  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :genre_id, :price, :salling_status)
  end

end
