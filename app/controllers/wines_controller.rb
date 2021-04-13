class WinesController < ApplicationController
  def index
    @wine = Wine.new
    @wines = Wine.all
  end
  
  def show
    @wine = Wine.find(params[:id])
  end
  
  def create
    @wine = Wine.new(wine_params)
    @wine.user_id = current_user.id
    @wine.save
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def wine_params
    prams.require(:wine).permit(:wine_image_id, :wine_name, :type, :country, :variety, :vintage, :price, :rating)
  end
  
end
