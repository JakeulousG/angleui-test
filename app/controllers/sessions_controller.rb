class SessionsController < ApplicationController
    include SessionsHelper
    
    def new
    end
  
    def create
      user = User.find_by(email:
        params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            login(user)
            flash[:success] = "Welcome back!"
            redirect_to root_url
        else
            flash[:warning] = "Login failed, invalid credentials!"
            render 'new'
        end
    end
  
    def destroy
      log_out
      flash[:success] = "Logout successful."
      redirect_to root_url
    end
end
