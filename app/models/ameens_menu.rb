class AmeensMenu < ActiveRecord::Base
  belongs_to :user #, :class_name => "User", :foreign_key => "user_id"
  belongs_to :channel #, :class_name => "Channel", :foreign_key => "channel_id"
  

  validates :user_id, presence: true
  #validates :channel_id, presence: true
  
  validates :category, presence: true
  validates :subcat, presence: true
  validates :item_code, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
