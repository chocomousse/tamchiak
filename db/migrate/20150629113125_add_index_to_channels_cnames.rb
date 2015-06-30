class AddIndexToChannelsCnames < ActiveRecord::Migration
  def change
    add_index :channels, :cnames, unique: true
  end
end
