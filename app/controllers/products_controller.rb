class ProductsController < ApplicationController
  def index
    @products = Product.all
    @genres = Genre.all
  end

  def new
    @product_new = Product.new
    @genres = Genre.all
  end

  def create
    @product_new = Product.new(product_params)
    @product_new.save
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end



  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :genre_id, :price, :salling_status)
  end

end
