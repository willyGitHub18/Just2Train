class ApplicationController < ActionController::Base
        
    
        before_action :configure_permitted_parameters, if: :devise_controller?
        protected
            def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:password, :password_confirmation, :current_password, :email, :username, :full_name, :biography, :phone, :street1, :street2, :city, :zip, :profile_picture) }
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:password, :password_confirmation, :current_password, :email, :username, :full_name, :biography, :phone, :street1, :street2, :city, :zip, :profile_picture) }
            end
end
