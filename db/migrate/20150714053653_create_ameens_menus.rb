class CreateAmeensMenus < ActiveRecord::Migration
  def change
    create_table :ameens_menus do |t|
      t.string :category
      t.string :subcat
      t.string :item_code
      t.string :name
      t.decimal :price
      t.references :user, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :ameens_menus, [:user_id, :created_at]
    add_index :ameens_menus, [:channel_id, :created_at]
  end
end
