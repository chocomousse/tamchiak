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
    @order = current_user.orders.build(order_params)
    @order.channel = current_channel
    
    if @order.save 
      flash[:success] = "Order has been recorded!"
      redirect_to order_received_path
    else 
      flash[:danger] = "Order was not recorded!"
     render 'new'
    end 
  end 

  private 
  def order_params
    params.require(:order).permit(:meal)
  end 
end
