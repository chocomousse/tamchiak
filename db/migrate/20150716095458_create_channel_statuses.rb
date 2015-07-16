class CreateChannelStatuses < ActiveRecord::Migration
  def change
    create_table :channel_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
