require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  def setup
    @channel = Channel.new(cname: "channelOne", menu: "Ameens")
  end 
  
  test "channel name has been taken" do
    duplicate_channel = @channel.dup
    @channel.save
    assert_not duplicate_channel.valid?
  end
  
    
end
