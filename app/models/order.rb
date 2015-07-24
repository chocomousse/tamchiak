class Order < ActiveRecord::Base
  #belongs_to :menu_item
  belongs_to :user 
  belongs_to :channel 

  validates :user_id, presence: true
  validates :channel_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_save :finalize

  #def unit_price
  # if persisted?
  #   self[:unit_price]
  #else
  # menu_item.price
  #end
  #end

  def sum_price
    @sum_price = current_order.unit_price*current_order.quantity
  end

  # Returns the current order
  def current_order
    @current_order ||= Order.find_by(id: user_id)
  end

  private

  def finalize
    #self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
