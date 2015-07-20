class RemoveOrderStatusIdFromChannels < ActiveRecord::Migration
  def change
    remove_column :channels, :order_status_id, :integer
  end
end
