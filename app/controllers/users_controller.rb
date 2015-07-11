class UsersController < ApplicationController 
  before_action :logged_in_user
  def show
    @user = User.find(params[:user_id])
  end 
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save 
      log_in(@user)
      flash[:success] = "Welcome to Tam Chiak!"
      redirect_to join_or_create_path
    else 
      render 'new'
    end 
  end 
  
  def edit
    @user = User.find(params[:user_id])
  end
  
  def update
    @user = User.find(params[:user_id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
  
  # Confirms a logged in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end