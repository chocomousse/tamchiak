class CsessionsController < ApplicationController
  include CsessionsHelper

  def create
    channel = Channel.find_by(params[:csession][:cname])
    if channel
      log_in(channel)
      redirect_to join_channel_path
    else
      flash[:danger] = 'The channel does not exist'
      render 'new'
    end 
  end 
  
  def destroy
    exit_channel if joined_channel
    redirect_to login_path
  end
end