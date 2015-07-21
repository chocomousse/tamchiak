class ChannelsController < ApplicationController
  before_action :logged_in_user  
  
  def show
    if !current_channel.nil? && current_channel.channel_status == "Open"
      @orders = current_channel.orders
      @channel = current_channel
    else 
      if current_channel.nil?
        flash[:danger] = "You are not in any channel. Please create or join a channel."
        redirect_to join_or_create_path
      else 
        flash[:danger] = "This channel is closed."
        redirect_to bill_path
      end
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
    @channel_owner.channel_status = "Open"
    
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
  
  def close   
    @channel = current_channel
    @channel.update_attribute(:channel_status, "Closed")
    flash[:danger] = "Your channel has been closed."
    redirect_to collate_path
  end
  
  def bill
    @channel = current_channel
    @bills ||= current_channel.orders.group(:user_id)
  end

  private 
  def channel_params
    params.require(:channel).permit(:cname, :menu, :channel_status, :delivery)
  end 
end 
