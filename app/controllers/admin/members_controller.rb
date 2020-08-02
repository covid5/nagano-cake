class Admin::MembersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@members = Member.page(params[:page]).per(8)
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
end

    private
    def member_params
	    params.require(:member).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:email,:postal_code,:address,:phone_number,:encrypted_password,:status,:created_at,:updated_at)

    end
end
