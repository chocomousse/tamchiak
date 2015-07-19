class Channel < ActiveRecord::Base
  belongs_to :channel_status
  has_many :orders
  before_create :set_channel_status
  before_save :update_subtotal
  
  #belongs_to :users
  def subtotal
    orders.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  
private
  def set_channel_status
    #self.channel_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
