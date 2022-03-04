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
    sign_in(resource_name, resource)
    message = I18n.t('devise.sessions.signed_in')
    if request.xhr?
      render :json => {:success => true, :login => true, :data => {:message => message}}
    else
      respond_to do |format|
        format.html {redirect_to admins_sign_in_path}
      end
    end
  end

  def failure
    user = User.find_by_email(session['user_auth'][:email])
     message = I18n.t('devise.failure.invalid')
      if user =! nil || user.active_for_authentication?
        flash[:error]= message unless request.xhr?
     else
       flash[:error]= user.inactive_message unless request.xhr?
       message = user.inactive_message    
      end
    respond_to do |format|
      format.json {render :json => {:authentication => 'failure', :data => {:message => message, :cause => 'invalid'} } }
      format.html {redirect_to '/users/sign_in'}
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
