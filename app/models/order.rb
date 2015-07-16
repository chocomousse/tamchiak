class Order < ActiveRecord::Base
  belongs_to :user 
  belongs_to :channel 
  
  validates :user_id, presence: true
  validates :channel_id, presence: true
  validates :meal, presence: true
end
