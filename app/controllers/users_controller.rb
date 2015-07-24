class UsersController < ApplicationController 
  before_action :logged_in_user, only: [:edit, :update, :choose, :destroy]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
  end 

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else 
      render 'new'
    end 
  end 

  def destroy
    @user = User.find(params[:id])
    if (@user == current_user)
      flash[:danger] = "You cannot delete your own account!"
      redirect_to admin_users_path
    else
      @user.destroy
      @users = User.all
      flash[:success] = "User deleted."
      redirect_to admin_users_path
    end
  end

  def admin_users
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to join_or_create_path
    else
      render 'edit'
    end
  end

  def bill 
    @relevant_orders = Order.where(channel_id: current_channel.id)
    @relevant_orders.each do |t|
      @customer = User.find(t.user_id)
      @customer.send_billing_email(current_channel)
    end
    flash[:info] = "The bills have been sent!"
    redirect_to bill_path
  end 

  # Sends password reset email.
  def send_billing_email
    UserMailer.send_bill(self, current_channel).deliver_now
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 

end