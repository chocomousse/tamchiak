class Channel < ActiveRecord::Base
  validates :channelName, presence: true, length: {maximum: 15}
  validates :menuType, presence: true, uniqueness: {case_sensitive: true}
end
