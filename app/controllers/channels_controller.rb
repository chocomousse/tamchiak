class ChannelsController < ApplicationController

  def show
    @channel = Channel.all
  end 
  
  def new
    @channel = Channel.new
  end
  
  def create 
    @channel = Channel.new(channel_params)
<<<<<<< HEAD
    if @channel.save    
      join_channel(@channel)
      flash[:success] = "Success!"
      redirect_to new_channel_path
    else 
      flash.now[:danger] = "This channel name is already taken."
      render 'new'
=======
  if @channel.save 
    flash[:success] = "Join your channel now!"
    redirect_to new_channel_path
    else 
     render 'new'
>>>>>>> Channels
    end 
  end 
  
  private 
  def channel_params
    params.require(:channel).permit(:cname, :menu)
  end 
end