class OrdersController < ApplicationController
  before_action :logged_in_user
  #before_action :authenticate_user
  
  def show
    @order = Order.all
  end 
  
  def new
    @order = Order.new
  end
  
  def create 
    @order = Order.new(order_params)
    if @order.save    
      flash[:success] = "Success!"
      redirect_to order_received_path
    else 
      flash.now[:danger] = "Invalid Order!"
      render 'new'
    end 
  end 
  
  private 
  def order_params
    params.require(:order).permit(:meal)
  end 
end

