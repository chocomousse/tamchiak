class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :meal
      t.references :user, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true
      t.references :menu_item, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :orders, [:user_id, :created_at]
    add_index :orders, [:channel_id, :created_at]
    add_index :orders, [:menu_item_id, :created_at]
  end
end
