# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  respond_to :html, :js
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    session['user_path'] = params[:admin]
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}")
    respond_to do |format|
      if sign_in(resource_name, resource)
        set_flash_message!(:notice, :signed_in)
        format.js { render js: "window.location.href = '/'" }
      end
    end
  end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
