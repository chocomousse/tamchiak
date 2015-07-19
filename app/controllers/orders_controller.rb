class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :in_a_channel

  def new
    @order = Order.new
  end

  def show
    @order = Order.all
  end

  def create 
    #@order.channel = current_channel

    #@channel = current_channel
    #menu_item = MenuItem.find_by(id: menu_item_id)
    #@order.menu_item = menu_item

    @order = current_channel.orders.new(order_params)
    @order.user = current_user

    if @order.save 
      redirect_to current_channel_path
    #        flash[:success] = "Order has been recorded!"
    #else 
    # flash[:danger] = "Order was not recorded!"
    #render 'new'
    #end 
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
    params.require(:order).permit(:quantity, :menu_item_id, :meal)
  end 
end
