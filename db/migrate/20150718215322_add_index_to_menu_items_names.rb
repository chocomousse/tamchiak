class AddIndexToMenuItemsNames < ActiveRecord::Migration
  def change
    add_index :menu_items, :name, unique: true
  end
end
