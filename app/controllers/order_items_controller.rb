class OrderItemsController < ApplicationController
  def create
    @channel = current_channel
    @order_item = @channel.order_items.new(order_item_params)
    @channel.save
    session[:channel_id] = @channel.id
  end

  def update
    @channel = current_channel
    @order_item = @channel.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @channel.order_items
  end

  def destroy
    @channel = current_channel
    @order_item = @channel.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @channel.order_items
  end
  
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
