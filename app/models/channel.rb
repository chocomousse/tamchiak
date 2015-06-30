class Channel < ActiveRecord::Base
  validates :cname, presence: true, length: {maximum: 15}, uniqueness: true
end
