class OrdersController < ApplicationController
  
  def create
  end 
  
  private 
  def order_params
    params.require(:order).permit(:meal)
  end 
end

