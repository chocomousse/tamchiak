class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :in_a_channel

  def new
    @menu_items = MenuItem.all
    @order = Order.new
  end

    # Returns the current order
  def current_order
    @current_order ||= Order.find_by(id: user_id)
  end
  
  def show
    @order = Order.all
  end

  def create 
    @menu_items = MenuItem.all
    @order = current_channel.orders.build(order_params)
    @order.user = current_user

    if @order.save 
      flash.now[:success] = "Order has been recorded!"
      render 'layout/channel_text'
    else 
      flash.now[:danger] = "Order was not recorded!"
      render 'new'
    end 
  end 

  def update
    @channel = current_channel
    @order = @channel.orders.find(params[:id])
    @order.update_attributes(order_params)
    @orders = @channel.orders
  end

  def destroy
    @channel = current_channel
    @order = @channel.orders.find(params[:id])
    @order.destroy
    @orders = @channel.orders
  end
 
  private 
  def order_params
    params.require(:order).permit(:quantity, :menu_item_id, :meal, :cat, :subcat, :item_code, :unit_price)
  end 
end