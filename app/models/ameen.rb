class Ameen < ActiveRecord::Base
  validates :category, presence: true
  validates :subcat, presence: true
  validates :item_code, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
