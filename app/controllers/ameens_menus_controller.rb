class AmeensMenusController < ApplicationController
  before_action :logged_in_user
  before_action :in_a_channel

  def show
    @ameens_menu = AmeensMenu.all
  end

  def new
    @ameens_menu = AmeensMenu.new
  end

  def create 
    #@ameens_menu = AmeensMenu.new(ameens_menu_params)
    @ameens_menu = current_user.ameens_menus.build(ameens_menu_params)
    if @ameens_menu.save 
      flash[:success] = "Item has been successfully added!"
      redirect_to ameensmenu_path
    else 
     flash[:success] = "Item has not been added!"
     render 'new'
    end 
  end 

  private 
  def ameens_menu_params
    channel_id = session[:channel_id]
    user_id = session[:user_id]
    params.require(:ameens_menu).permit(:category, :subcat, :item_code, :name, :price)
  end 
end
