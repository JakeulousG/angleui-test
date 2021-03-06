module SessionsHelper
    def login(user)
        session[:user_id] = user.id
    end

    def logged_in?
        !current_user.nil?
    end
    
    def only_loggedin_users
        redirect_to new_session_url, flash: { warning: "Please login first..."} unless logged_in?
    end

    def current_user?(user)
        user == current_user
    end
    
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id:
            session[:user_id])
        end
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
