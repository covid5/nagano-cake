class Admin::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
		range = Date.yesterday.beginning_of_day..Date.yesterday
		@orders = Order.where(created_at: Date.today)
	end
end
