class ChannelsController < ApplicationController
  before_action :logged_in_user  
  
  def show
    if !current_channel.nil?
      @orders = current_channel.orders
      @channel = current_channel
    else 
      flash[:danger] = "You are not in any channel. Please create or join a channel."
      redirect_to join_or_create_path
    end
  end

  def display
    @channel_owner = current_user.channels
  end 

  def new
    @channel_owner = Channel.new
  end

  def create 
    @channel_owner = current_user.channels.new(channel_params)
    if @channel_owner.save    
      join_channel(@channel_owner)
      flash[:success] = "Success!"
      @channel = current_channel
      redirect_to current_channel_path
    else 
      flash.now[:danger] 
      render 'new'
    end 
  end 

  private 
  def channel_params
    params.require(:channel).permit(:cname, :menu)
  end 
end 
