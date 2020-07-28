class Member::ApplicationController < Member::ActionController::Base

	# before_action :authenticate_admin!
	before_action :configure_permitted_parameters, if: :devise_controller?
  	protect_from_forgery with: :exception

  	# sign_in後のリダイレクト先変更
  def after_sign_in_path_for(resource)
    members_about_path
  end
  # sign_out後のリダイレクト先変更
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number])
  end
end
