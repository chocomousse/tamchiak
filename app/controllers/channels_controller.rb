class ChannelsController < ApplicationController
  before_action :logged_in_user
  #before_action :authenticate_user

  def show
    @channel = Channel.all
  end 

  def new
    @channel = Channel.new
  end

  def create 
    @channel = Channel.new(channel_params)
    if @channel.save    
      join_channel(@channel)
      flash[:success] = "Success!"
      redirect_to new_channel_path
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
