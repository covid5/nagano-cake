class Admin::SearchController < ApplicationController
	before_action :authenticate_admin!

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @records = search_for(@model, @content)
  end

  private
  def search_for(model, content)
    if model == 'member'
        Member.where('first_name LIKE ? or last_name LIKE ? or first_name_kana LIKE ? or last_name_kana LIKE ?', '%'+content+'%', '%'+content+'%', '%'+content+'%', '%'+content+'%')
    elsif model == 'product'
        Product.where('name LIKE ?', '%'+content+'%')
    end
  end
end
