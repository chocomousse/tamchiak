class Channel < ActiveRecord::Base
  has_many :orders
  before_save :update_subtotal
  
  belongs_to :user
  
  validates :cname, presence: true
  validates :menu, presence: true
  validates :delivery, presence: true
  
  def subtotal
    orders.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  
private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
