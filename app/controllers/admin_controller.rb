class AdminController < ApplicationController
    include ApplicationHelper
    before_action :is_loggedin?

    def show
        @admin = Admin.find(params[:id])
        @avatar = @admin.avatar
        @cover_photo = @admin.cover_photo
    end

    def index
        @admins = Admin.all
        @admin = Admin.new
    end

    def create
        @admin = Admin.new(new_admin_arams)
        if @admin.save
            flash[:notice] = "New Admin User Added Successfully!"
            redirect_back(fallback_location: root_path)
        else
            flash[:warning] = @admin.errors.full_messages.to_sentence
            redirect_back(fallback_location: root_path)
        end
    end
    
    def edit
        @admin = Admin.find(params[:id])
        if @admin.role == "Staff"
            flash[:warning] = "Unauhtorized Access!"
            redirect_back(fallback_location: root_path)
        end
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

    def destroy
        @admin = Admin.find(params[:id]).destroy
        render :json => @admin
    end

    protected
    def admin_params
        params.require(:admin).permit(:name, :email, :bio, :avatar, :cover_photo)
    end
    def super_admin_params
        params.require(:admin).permit(:name, :email, :bio, :role, :avatar, :cover_photo)
    end
    def new_admin_arams
        params.require(:admin).permit(:name, :email, :bio, :role, :password, :password_confirmation, :avatar, :cover_photo)
    end
end
