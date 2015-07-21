class AddBillToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :bill, :decimal
  end
end
