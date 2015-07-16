class Channel < ActiveRecord::Base
  belongs_to :channel_status
  has_many :order_items
  before_create :set_channel_status
  before_save :update_subtotal
  
  #belongs_to :users

end
