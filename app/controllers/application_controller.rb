class ApplicationController < ActionController::Base

	# # before_action :authenticate_admin!
	# before_action :configure_permitted_parameters, if: :devise_controller?
 #  	protect_from_forgery with: :exception


  	# sign_in後のリダイレクト先変更
  def after_sign_in_path_for(resource)
    case resource
    when admin
      root_path(resource)
    when member
      member_path
    end
  end
  # sign_out後のリダイレクト先変更
  def after_sign_out_path_for(resource)
    case resource
    when admin
      new_admin_session_path
    when member
      member_top_path
    end
  end


 #  protected
 #  def configure_permitted_parameters
 #  	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
 #  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number])
  end

end
