class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_code
      t.string :name
      t.decimal :price
      t.string :cat
      t.string :subcat
      t.boolean :active

      t.timestamps null: false
    end
  end
end
