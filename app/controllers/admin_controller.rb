class AdminController < ApplicationController
    include ApplicationHelper
    before_action :is_loggedin?

    def show
        @admin = Admin.find(params[:id])
    end

    def index
        @admins = Admin.all
        @admin = Admin.new
    end
    
    def edit
        @admin = Admin.find(params[:id])
    end

    def update
        @admin = Admin.find(params[:id])
        params = current_admin.role == "Super Admin"? super_admin_params : admin_params
        if @admin.update(params)
        flash[:notice] = "Update successfully"
        redirect_to admin_index_path
        else
        render 'edit'
        end
    end

    protected
    def admin_params
        params.require(:admin).permit(:name, :email, :bio)
    end
    def super_admin_params
        params.require(:admin).permit(:name, :email, :bio, :role)
    end
end
