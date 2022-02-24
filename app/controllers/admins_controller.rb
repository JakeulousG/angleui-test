class AdminsController < Devise::RegistrationsController
    include ApplicationHelper
    before_action :is_loggedin?
    skip_before_action :require_no_authentication, only: [:index]

    def show
        @admin = Admin.find(params[:id])
    end
    def index
        @admins = Admin.all
        @admin = Admin.new
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            flash[:success] = "Admin account added"
        else
            flash[:warning] = "submission failed"
        end
      redirect_back(fallback_location: root_path)
    end

    private
    def admin_params
        params.require(:admin).permit(:name, :email, :password, :password_confirmation, :bio)
    end
end
