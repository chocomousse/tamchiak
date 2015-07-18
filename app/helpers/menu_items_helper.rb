module MenuItemsHelper
  def index
    @ameens_menus = MenuItem.all
  end
end
