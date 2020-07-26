class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def tax_price
  	product.price * 1.1
  end

  def sum_price
  	tax_price * number
  end

end
