class Channel < ActiveRecord::Base
  has_many :ameens_menus, dependent: :destroy
  validates :cname, presence: true, length: {maximum: 30}, uniqueness: true
  validates :menu, presence: true

end
