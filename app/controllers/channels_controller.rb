class ChannelsController < ApplicationController
  before_action :logged_in_user  
  
  def show
    @channel_owner = current_channel
    @orders = current_channel.orders
  end

  def display
    @channel_owner = Channel.all
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
