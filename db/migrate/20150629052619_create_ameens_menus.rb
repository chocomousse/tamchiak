class CreateAmeensMenus < ActiveRecord::Migration
  def change
    create_table :ameens_menus do |t|
      t.string :category
      t.string :subcat
      t.string :item_code
      t.string :name
      t.decimal :price
    # t.references :user, index: true
      t.references :channel, index: true

      t.timestamps null: false
    end
  # add_index :ameensmenus, [:user_id, :created_at]
    add_index :ameensmenus, [:cname_id, :created_at]
  end
end
