class AmeensMenusController < ApplicationController
  def show
    @ameens_menu = AmeensMenu.all
  end
  
  def new
    @ameens_menu = AmeensMenu.new
  end
  
  def create 
    @ameens_menu = AmeensMenu.new(ameens_menu_params)
    if @ameens_menu.save 
      flash[:success] = "Item has been successfully added!"
      redirect_to ameensmenu_path
    else 
      render 'new'
    end 
  end 
  
  private 
  def ameens_menu_params
    params.require(:ameens_menu).permit(:category, :subcat, :item_code, :name, :price)
  end 
end
