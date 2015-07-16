module SessionsHelper 
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Joins a room
  def join_channel(channel)
    session[:channel_id] = channel.id
  end 

  # Returns the channel
  def current_channel 
    if (channel_id = session[:channel_id])
      @current_channel ||= Channel.find_by(id: channel_id)
    elsif (channel_id = cookies.signed[:channel_id])
      channel = Channel.find_by(id: channel_id)
      if channel
        join_channel channel
        @current_channel = channel
      end 
    end
  end

  # Returns true if the user has joined a channel, false otherwise.
  def joined_channel?
    !current_channel.nil?
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end  
  end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end  

  def exit_channel
    forget(current_channel)
    session.delete(:cname_id)
    @current_channel = nil
  end 

  # Authenticates a user
  def authenticate_user
    if session[:user_id]
      @current_user ||= User.find_by(id: user_id)
    else 
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end