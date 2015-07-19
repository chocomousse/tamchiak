class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # Returns the current order
  def current_order
    @current_order ||= Order.find_by(id: user_id)
  end

  private
  # Confirms a logged in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms that a user is in a channel
  def in_a_channel 
    unless joined_channel?
      flash[:danger] = "Please join a channel"
      redirect_to join_channel_url
    end
  end

end 