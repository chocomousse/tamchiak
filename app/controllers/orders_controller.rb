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
    #@order = current_user.orders.build(order_params)
    @order.channel = current_channel
    
    #added on
    @order = @channel.orders.new(order_params)
    @channel.save
    session[:channel_id] = @channel.id
    
    if @order.save 
      flash[:success] = "Order has been recorded!"
      redirect_to order_received_path
    else 
      flash[:danger] = "Order was not recorded!"
     render 'new'
    end 
  end 
  
  def update
  end

  private 
  def order_params
    params.require(:order).permit(:quantity, :menu_item_id)
  end 
end
