class Channel < ActiveRecord::Base
  validates :cname, presence: true, length: {maximum: 30}, uniqueness: true
  validates :menu, presence: true

end
