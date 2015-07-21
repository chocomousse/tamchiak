class AddChannelStatusToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :channel_status, :string
  end
end
