class CustomFailure < Devise::FailureApp
  def redirect_url
    # flash[:warning] = "Invalid credentials"
    # new_admin_session_path(:subdomain => 'secure', :format => :html)
    if request.xhr?
      send(:"new_#{scope}_session_path", :format => :js)
    else
      super
    end
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end