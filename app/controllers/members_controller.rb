class MembersController < ApplicationController
  before_action :authenticate_member!, only: [:show, :edit, :update, :withdraw, :hide]

	def edit
	  	@member = Member.find(params[:id])
	  	if current_member.id != @member.id
	  		redirect_to members_top_path(@member)
	  	end
	end

	def show
	  	@member = current_member
	end

	def update
	    @member = current_member
	    if @member.update(member_params)
	      redirect_to member_path(@member), success: 'お客様情報が更新されました！'
	    else
	      flash[:danger] = 'お客様の情報を更新出来ませんでした。空欄の箇所はありませんか？'
	      render :edit
	    end
	end

	def withdraw
	end

	def top
		@genres = Genre.where.not(disabled: "true")
		@products = Product.order("RANDOM()").limit(4)
	end

	def about
	end

    def hide
    	@member = current_member
	    @member.update(status: true)
	    reset_session
	    redirect_to members_top_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
    end

	  private

	  def member_params
	    params.require(:member).permit(:status, :first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :email, :phone_number)
	  end
end
