class Admin::MembersController < ApplicationController

	def index
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end


	def update
		@member = Member.find(params[:id])
		@member.update(member_params)
		if @member.update(member_params)
			redirect_to admin_member_path(@member.id)
		else
			render :edit
	end
	end

private
def member_params
	params.require(:member).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:email,:postal_code,:address,:phone_number,:encrypted_password,:status,:created_at,:updated_at)

end
end
