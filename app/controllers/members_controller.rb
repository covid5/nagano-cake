class MembersController < ApplicationController
  before_action :authenticate_member!

	  def edit
	  	@member = Memeber.find(params[:id])
	  	if current_member.id != @member.id
	  		redirect_to members_top_path(@member)
	  end

	  def show
	  	@member = Member.find(params[:id])
	  	@member = Member.new
	  	@member = Member.all
	    end

	  def update
	    @member = member_customer
	    if @member.update(member_params)
	      redirect_to members_path(@member), success: 'お客様情報が更新されました！'
	    else
	      flash[:danger] = 'お客様の情報を更新出来ませんでした。空欄の箇所はありませんか？'
	      render :edit
	    end
	  end

	  def withdraw
	    @member = current_member
	    @member.update(is_active: false)
	    reset_session
	    redirect_to members_top_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
	  end

	def top
	end

	def about
		@member = Memeber.find(params[:id])
		@member = Member.all
	end

    def hide
    end

	  private

	  def member_params
	    params.require(:member).permit(:is_active, :first_name, :first_name_kana, :family_name, :family_name_kana, :post_code, :address, :email, :tel, cart_items_attributes: [:_destroy])
	  end
	end
end
