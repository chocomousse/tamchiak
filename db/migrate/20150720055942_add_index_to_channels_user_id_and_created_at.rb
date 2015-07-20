class AddIndexToChannelsUserIdAndCreatedAt < ActiveRecord::Migration
  def change
    add_index :channels, [:user_id, :created_at]
  end
end
