class Admin::ApplicationController < ApplicationController
	before_action :configure_permitted_parameters, if: :devise_controller?
  	protect_from_forgery with: :exception

  	# sign_in後のリダイレクト先変更
  def after_sign_in_path_for(resource)
    root_path(resource)
  end
  # sign_out後のリダイレクト先変更
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end
