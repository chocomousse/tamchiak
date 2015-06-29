class CreateAmeensMenus < ActiveRecord::Migration
  def change
    create_table :ameens_menus do |t|
      t.string :category
      t.string :subcat
      t.string :item_code
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
