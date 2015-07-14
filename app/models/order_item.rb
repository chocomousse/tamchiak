class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :channel
  belongs_to :user
  
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :item_present
  validate :channel_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def item_present
    if item.nil?
      errors.add(:item, "is not valid or is not active.")
    end
  end

  def channel_present
    if channel.nil?
      errors.add(:channel, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
