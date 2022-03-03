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
    @avatar = @user.avatar
    @cover_photo = @user.cover_photo
  end

  def index
    @users = User.all.order(created_at: :desc)
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @avatar = @user.avatar
    @cover_photo = @user.cover_photo
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_back(fallback_location: root_path)
    else
      flash[:warning] = @user.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    render :json => @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :avatar, :cover_photo)
  end
end
