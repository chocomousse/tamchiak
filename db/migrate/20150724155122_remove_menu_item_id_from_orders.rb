class RemoveMenuItemIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :menu_item_id, :integer
  end
end
