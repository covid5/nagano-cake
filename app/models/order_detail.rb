class OrderDetail < ApplicationRecord
	belongs_to :product
	belongs_to :order
	enum production_status: {着手不可:1, 製作待ち:2, 制作中:3, 製作完了:4}
end
