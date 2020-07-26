class Admin::MembersController < Admin::ApplicationController

	def index
		@members = Member.all
	end

	def show
		@members = Member.find(params[:id])
	end

	def edit
		@members = Member.find(params[:id])
	end


	def update
		@members = Member.find(params[:id])
		@member.update(member_params)
		if @member.update(member_params)
			redirect_to admin_member(@member.id)
		else
			render :edit
	end
	end

private
def member_params
	params.require(:member).permit(:first_name,:last_name,:last_name,:last_name_kana,:email,:postal_code,:address,:phone_number,:encrypted_password,:status,:created_at,:updated_at)

end
end
