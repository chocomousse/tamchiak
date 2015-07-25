class ChannelsController < ApplicationController
  before_action :logged_in_user  
  before_action :admin_user, only: :destroy

  def show
    if !current_channel.nil? && current_channel.channel_status == "Open"
      @orders = current_channel.orders
      @channel = current_channel
    else 
      if current_channel.nil?
        flash[:danger] = "You are not in any channel. Please create or join a channel."
        redirect_to join_or_create_path
      else 
        redirect_to bill_path
      end
    end
  end

  def display
    @channel_owner = current_user.channels
    @user = current_user
  end 

  def new
    @channel_owner = Channel.new
  end

  def admin_channels
    @channels = Channel.all
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

  def toggle_status   
    @channel = current_channel
    if @channel.channel_status == "Closed"
      @channel.update_attribute(:channel_status, "Open")
      flash[:success] = "This channel is now open."
      redirect_to current_channel_path
    else
      @channel.update_attribute(:channel_status, "Closed")
      redirect_to collate_path
    end
  end

  def bill
    if current_channel.nil?
      flash[:danger] = "Please create or join a channel."
      redirect_to join_or_create_path
    else
      @channel = current_channel
      @bills ||= current_channel.orders.group(:user_id)
      @orders = @channel.orders
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    @channels = Channel.all
    flash[:success] = "Channel deleted."
    redirect_to admin_channels_path
  end

  private 
  def channel_params
    params.require(:channel).permit(:cname, :menu, :channel_status, :delivery, :created_at, :added_by)
  end 
end 
