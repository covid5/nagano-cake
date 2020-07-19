class Product < ApplicationRecord
	attachment :image
	# belongs_to :admin
	belongs_to :genre, foreign_key: "genre_id"

	enum salling_status:{sale: 0, soldout: 1}
end
