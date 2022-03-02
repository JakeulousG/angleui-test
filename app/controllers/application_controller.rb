class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Devise::Controllers::Helpers

  def dashboard
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio, :role, :avatar, :cover_photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :bio, :role, :password, :password_confirmation, :avatar, :cover_photo])
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end
