module MembersHelper
	def addTax(money,rate)
   taxed_money =  (money*rate).round
   "税込#{taxed_money}円"
  end
end
