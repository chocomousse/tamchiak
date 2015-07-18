class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:new_order, :destroy]

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        # Log the user in and redirect to the user's show page.
        log_in(user)
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        remember user
        redirect_to join_or_create_path
      else 
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to login_url
      end 
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end 

  def new_order
    channel = Channel.find_by(cname: params[:session][:cname])
    if channel 
      join_channel(channel)
      redirect_to menu_path
    else 
      flash.now[:danger] = "Channel does not exist"
      render 'joining_a_channel'
    end 
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def quit
    exit_channel if joined_channel?
    redirect_to join_or_create_path
  end

end 
