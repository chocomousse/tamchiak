class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :cname
      t.string :menu
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :ameens_menus, [:user_id, :created_at]
  end
end