class AddIndexToAmeensMenusItemCode < ActiveRecord::Migration
  def change
    add_index :ameens_menus, :item_code, unique: true
  end
end
