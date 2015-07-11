class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :meal

      t.timestamps null: false
    end
  end
end
