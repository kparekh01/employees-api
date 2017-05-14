class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :restrict_access

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthday, :about, :email, :password, :current_password, :remember_me])
  end

  def restrict_access
    authenticate_or_request_with_http_token do |api_key, options|
      User.find_by(email: request.headers['X-User-Email'], api_key: api_key)
    end
  end
end
