class AmeensMenu < ActiveRecord::Base
  before_save { self.item_code = item_code.upcase}
  validates :category, presence: true
  validates :subcat, presence: true
  validates :item_code, presence: true
                        uniqueness: {case_sensitive: false}
  validates :name, presence: true
  validates :price, presence: true
end
