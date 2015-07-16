class Channel < ActiveRecord::Base
  has_many :users
  has_many :orders, dependent: :destroy
  validates :cname, presence: true, length: {maximum: 30}, uniqueness: true
  validates :menu, presence: true

end
