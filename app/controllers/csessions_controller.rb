class CsessionsController < ApplicationController
  include CsessionHelper
  
  def new
  end
  
  def create
    channel = Channel.find_by(cname: [:csession][:cname])
    if channel 
      join_channel channel
      redirect_to channel
    else
      flash[:danger] = 'The channel does not exist'
      render 'new'
    end 
  end 
  
  def destroy
    exit_channel if joined_channel
    redirect_to @user
  end
end