class Channel < ActiveRecord::Base
<<<<<<< HEAD
  validates :cname, presence: true, length: {maximum: 30}, uniqueness: true
=======
  validates :cname, presence: true, length: {maximum: 15}
  validates :menu, presence: true
>>>>>>> Channels
end
