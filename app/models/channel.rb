class Channel < ActiveRecord::Base
  #belongs_to :users
  has_many :users
  has_many :ameens_menus, dependent: :destroy
  validates :cname, presence: true, length: {maximum: 30}, uniqueness: true
  validates :menu, presence: true

end
