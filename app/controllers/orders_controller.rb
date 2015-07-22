class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :in_a_channel

  def new
    @menu_items = MenuItem.group(:cat)
    @order = Order.new
  end

  # Returns the current order
  def current_order
    @current_order ||= Order.find_by(id: user_id).all
  end
  
  def collate
    @channel = current_channel
    @relevant_orders ||= Order.where(channel_id: current_channel.id).group(:meal)
    @orders_in_channel ||= Order.where(channel_id: current_channel.id)
    @specific_orders ||= Order.where(channel_id: current_channel.id).group(:meal, :subcat)
  end 

  def show
    @order = Order.all
  end

  def create 
    @menu_items = MenuItem.all
    @order = current_channel.orders.build(order_params)
    @order.user = current_user

    if @order.save 
      flash[:success] = "Order has been recorded!"
      render :js => "window.location = '/channels/show'"
    else 
      flash[:danger] = "Order was not recorded!"
      render 'new'
    end 
  end 

  def destroy
    @order = current_channel.orders.find(params[:id])
    if @order.user == current_user
      @order.destroy
      @orders = current_channel.orders
      flash[:success] = "Your order has been deleted."
      redirect_to current_channel_path
    else
      flash[:danger] = "You can only delete orders that you have made!"
      redirect_to current_channel_path
    end
  end

  private 
  def order_params
    params.require(:order).permit(:quantity, :menu_item_id, :meal, :cat, :subcat, :item_code, :unit_price)
  end 
end