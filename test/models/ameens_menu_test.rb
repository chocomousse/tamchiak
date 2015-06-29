require 'test_helper'

class AmeensMenuTest < ActiveSupport::TestCase
  def setup
    @ameens_menu = AmeensMenu.new(category: "Example Cat", subcat: "Example Sub-cat", item_code: "Example Item Code", name: "Example Name", price: "Example price")
  end

  test "should be valid" do
    assert @ameens_menu.valid?
  end
  
  test "category should be present" do
    @ameens_menu.category = "     "
    assert_not @ameens_menu.valid?
  end  
  
  test "sub-category should be present" do
    @ameens_menu.subcat = "     "
    assert_not @ameens_menu.valid?
  end
  
  test "name should be present" do
    @ameens_menu.name = "     "
    assert_not @ameens_menu.valid?
  end
  
  test "item code should be present" do
    @ameens_menu.item_code = "     "
    assert_not @ameens_menu.valid?
  end  
  
  test "item codes should be unique" do
    duplicate_ameens_menu = @ameens_menu.dup
    duplicate_ameens_menu.item_code = @ameens_menu.item_code.upcase
    @ameens_menu.save
    assert_not duplicate_ameens_menu.valid?
  end  

  test "price should be present" do
    @ameens_menu.price = "     "
    assert_not @ameens_menu.valid?
  end  
end
