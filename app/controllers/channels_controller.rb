class ChannelsController < ApplicationController

  def show
    @channel = Channel.find(params[:id])
  end 
  
  def new
    @channel = Channel.new
  end
  
  def create 
    @channel = Channel.new(channel_params)
    if @channel.save 
      join_channel @channel
      flash[:success] = "Join your channel now!"
      redirect_to @channel
    else 
      render 'new'
    end 
  end 
  
  private 
  def channel_params
    params.require(:channel).permit(:cname, :menu)
  end 
end