require 'test_helper'

class JoinChannelTest < ActionDispatch::IntegrationTest
  def setup
    @channel = channels(:channelTest)
  end
  
  test "Invalid Channel" do
    get join_channel_path
    assert_template 'csessions/new'
    post join_channel_path, csssion:{cname:"", menu:""}
    assert_template 'csessions/new'
    assert_not flash.empty?
    get join_channel_path
    assert flash.empty?
  end
  
end
