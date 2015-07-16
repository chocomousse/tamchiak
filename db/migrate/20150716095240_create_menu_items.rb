class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :cat
      t.string :subcat
      t.string :item_code
      t.decimal :price
      t.boolean :active

      t.timestamps null: false
    end
  end
end
