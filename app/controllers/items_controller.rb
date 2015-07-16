class ItemsController < ApplicationController
  def index
    @items = Item.all
    @order_item = current_channel.order_items.new
  end

end
