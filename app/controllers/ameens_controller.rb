class AmeensController < ApplicationController
  before_action :logged_in_user
  
  def show
    @ameens = Ameen.all
  end

  def new
    @ameens = Ameen.new
  end
  
  def create 
    @ameens = Ameen.new(ameen_params)
    
    if @ameens.save 
      flash[:success] = "Item has been successfully added!"
      redirect_to ameens_menu_path
    else 
      flash[:danger] = "Item has not been added!"
      render 'new'
    end 
  end 

  private 
  def ameen_params
    params.require(:ameen).permit(:category, :subcat, :item_code, :name, :price)
  end 
  
end
