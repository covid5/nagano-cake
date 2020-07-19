class ApplicationController < ActionController::Base
	# before_action :authenticate_admin!
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

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
