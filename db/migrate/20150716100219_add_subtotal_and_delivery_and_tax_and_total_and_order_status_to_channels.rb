class AddSubtotalAndDeliveryAndTaxAndTotalAndOrderStatusToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :subtotal, :decimal
    add_column :channels, :delivery, :decimal
    add_column :channels, :tax, :decimal
    add_column :channels, :total, :decimal
    add_reference :channels, :order_status, index: true, foreign_key: true
  end
end
