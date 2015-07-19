class AddCatAndSubcatAndItemCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cat, :string
    add_column :orders, :subcat, :string
    add_column :orders, :item_code, :string
  end
end
