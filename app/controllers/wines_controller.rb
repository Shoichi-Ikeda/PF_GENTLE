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
    redirect_to wines_path(@wine)
  end

  def edit
  end

  def update
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path
  end

  private

  def wine_params
    params.require(:wine).permit(:wine_image, :wine_name, :kind, :country, :variety, :vintage, :price, :rating)
  end

end
