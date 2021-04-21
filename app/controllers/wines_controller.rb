class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]

  def index
    @wine = Wine.new
    @wines_all = Wine.all
    @wines = Wine.page(params[:page]).per(12)
  end

  def show
    @wine = Wine.find(params[:id])
    @post_comment = PostComment.new
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
    redirect_to wine_path(@wine)
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

  def ensure_correct_user
    @wine = Wine.find(params[:id])
    unless @wine.user == current_user
      redirect_to wines_path
    end
  end
end