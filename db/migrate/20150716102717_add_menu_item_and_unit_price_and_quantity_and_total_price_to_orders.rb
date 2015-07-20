class AddMenuItemAndUnitPriceAndQuantityAndTotalPriceToOrders < ActiveRecord::Migration
  def change
    #add_reference :orders, :menu_item, index: true, foreign_key: true
    add_column :orders, :unit_price, :decimal
    add_column :orders, :quantity, :integer
    add_column :orders, :total_price, :decimal
  end
end
