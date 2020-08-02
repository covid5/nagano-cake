class Product < ApplicationRecord
	attachment :image

	has_many :cart_products, dependent: :destroy
	# belongs_to :admin
	belongs_to :genre, foreign_key: "genre_id"

	enum salling_status:{sale: 0, soldout: 1}

	def tax_price
  	  price * 1.1
    end


end
