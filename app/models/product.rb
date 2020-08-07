class Product < ApplicationRecord
	attachment :image

	has_many :cart_products, dependent: :destroy
	belongs_to :genre, foreign_key: "genre_id"

	validates :name, presence: true
	validates :description, presence: true
	validates :genre_id, presence: true
	validates :price, presence: true
	validates :salling_status, presence: true

	enum salling_status: { 販売中: 0, 売切: 1}

	def tax_price
  	  price * 1.1
    end


end
