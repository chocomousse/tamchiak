class CsessionsController < ApplicationController
  def new
  end
  
  def create
    channel = Channel.find_by(cname: [:csession][:cname])
    if channel 
      #jointhe channel
      else
      flash[:danger] = 'The channel does not exist'
      render 'new'
    end 
  end 
  
end
