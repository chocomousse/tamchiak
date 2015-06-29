require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  def setup
    @channel = Channel.new(cname: "channelOne", menu: "Ameens")
  end 
  
  test "menu type only accepts Ameens or Macs" do
    valid_channelNames = %w[ameens macs ameen]
    valid_channelNames.each do |valid_channelName|
      @channel.channelName = valid_channelName
      assert @channel.valid?, "#{valid_channelName.inspect} should be valid"
    end
  end 
  
  test "channel name has been taken" do
    duplicate_channel = @channel.dup
    @channel.save
    assert_not duplicate_channel.valid?
  end
  
    
end
