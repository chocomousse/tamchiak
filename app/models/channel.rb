class Channel < ActiveRecord::Base
  validates :cname, presence: true, length: {maximum: 15}
  validates :menu, presence: true
end
