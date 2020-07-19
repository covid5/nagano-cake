class Member < ApplicationRecord
	enum status: { 有効:false, 退会済み:true }
	has_many :orders
end
