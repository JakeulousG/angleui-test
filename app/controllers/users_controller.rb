class UsersController < ApplicationController
  include ApplicationHelper
  before_action :admin_signed_in?, only: [:edit, :show, :destroy]
  before_action :is_loggedin?
  before_action :is_staff?, only: [:edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your Account was Created Successfully!"
      redirect_to root_url
    else
      flash[:warning] = @user.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.order(updated_at: :desc)
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to users_url
    else
      flash[:warning] = @user.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:warning] = "User deleted!"
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio)
  end
end
