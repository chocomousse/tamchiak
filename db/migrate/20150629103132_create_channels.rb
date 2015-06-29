class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :cname
      t.string :menu

      t.timestamps null: false
    end
  end
end
