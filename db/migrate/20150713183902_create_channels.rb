class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :cname
      t.string :menu
      t.decimal :subtotal
      t.decimal :delivery
      t.decimal :taxes
      t.decimal :total
      t.references :user, index: true, foreign_key: true
      t.references :channel_status

      t.timestamps null: false
    end
    add_index :users, [:user_id, :created_at]
  end
end