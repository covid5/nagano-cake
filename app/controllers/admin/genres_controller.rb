class Admin::GenresController < ApplicationController
	before_action :authenticate_admin!

	def index
		@genre = Genre.new
		@genres = Genre.page(params[:page]).per(8)
	end

	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to request.referer, notice: "登録されました"
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)
		redirect_to admin_genres_path, notice: "更新されました"
	end


    private

    def genre_params
	    params.require(:genre).permit(:name, :disabled)
    end

end
