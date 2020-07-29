class Admin::HomesController < ApplicationController
	def top
		range = Date.yesterday.beginning_of_day..Date.yesterday
		@orders = Order.where(created_at: Date.today)
	end
end
