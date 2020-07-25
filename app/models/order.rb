class Order < ApplicationRecord
  enum payment_method:{credit_card: 0, bank_transfer: 1}

	belongs_to :member
	has_many :order_detail

attachments :profile_image


end
