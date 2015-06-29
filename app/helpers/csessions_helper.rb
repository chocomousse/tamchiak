module CsessionsHelper
  #Joins the given channel 
  def join_channel(channel)
    csession[:channel_id] = channel.id
  end 
  
  def current_channel
    @current_channel ||= Channel.find_by(id: csession[:channel_id])
  end
  
  def joined_channel?
    !current_channel.nil?
  end 
  
  def exit_channel 
    csssion.delete(:channel_id)
    @current_channel = nil
  end
end
