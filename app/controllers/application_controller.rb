class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top, :about]
    
    protect_from_forgery with: :exception
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
	def after_sign_in_path_for(resource)
        # show2_path
        user_path(resource)
	end
	def after_sign_out_path_for(resource)
		root_path
	end
    def after_sign_up_path_for(resource)
        # show2_path
        user_path(resource)
  	end
	
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :name, :password, :password_confirmation])
	end
end

# class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def after_sign_in_path_for(resource)
#     user_path(resource)
#   end

#   def after_sign_out_path_for(resource)
#     root_path
#   end

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
#   end
# end
