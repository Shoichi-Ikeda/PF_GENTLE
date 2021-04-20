class WinesController < ApplicationController
  def index
    @wine = Wine.new
    @wines_all = Wine.all
    @wines = Wine.page(params[:page]).per(9)
  end

  def show
    @wine = Wine.new
    @wines = Wine.find(params[:id])
  end

  def create
    wine_image = params[:wine]["wine_image"]
    wine_name = params[:wine]["wine_name"]
    kind = params[:wine]["kind"]
    country = params[:wine]["country"]
    variety = params[:wine]["variety"]
    vintage = params[:wine]["vintage(1i)"]
    price = params[:wine]["price"]
    rating = params[:wine]["rating"]
    @wine = Wine.new(wine_image: wine_image, wine_name: wine_name, kind: kind, country: country, variety: variety, vintage: vintage, price: price, rating: rating)
    @wine.user_id = current_user.id
    @wine.save
    redirect_to wines_path(@wine.id)
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)
    redirect_to wines_path
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