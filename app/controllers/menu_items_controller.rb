class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
    @order = current_channel.orders.new
    #@order = Order.new
  end
end
