class Order < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :user 
  belongs_to :channel 
  
  validates :user_id, presence: true
  validates :channel_id, presence: true
  validates :menu_item_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
 before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      menu_item.price
    end
  end

  def total_price
    unit_price * quantity
  end

private

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
