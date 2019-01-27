class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	#before_action :authenticate_user!

	protected

	def after_sign_in_path_for(resource)
  		user_path(current_user)
	end

	def after_sing_out_path_for(resource)
		root_path
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:email])
		devise_parameter_sanitizer.permit(:sing_in, keys:[:name])
	end
end
