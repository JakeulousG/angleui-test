class CustomFailure < Devise::FailureApp
    def redirect_url
        new_admin_session_path(:subdomain => 'secure', :format => :html)
    end
  
    def respond
      if http_auth?
        http_auth
      else
        redirect
      end
    end
end