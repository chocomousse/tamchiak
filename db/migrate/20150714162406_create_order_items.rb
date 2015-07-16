class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :item, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.decimal :unit_price
      t.integer :quantity
      t.decimal :total_price

      t.timestamps null: false
    end
  end
end
