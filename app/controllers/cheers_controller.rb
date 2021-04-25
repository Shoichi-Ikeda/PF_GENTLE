# frozen_string_literal: true
class CheersController < ApplicationController
  def create
    @wine = Wine.find(params[:wine_id])
    cheer = @wine.cheers.new(user_id: current_user.id)
    cheer.save
    redirect_to request.referer
  end

  def destroy
    @wine = Wine.find(params[:wine_id])
    cheer = @wine.cheers.find_by(user_id: current_user.id)
    cheer.destroy
    redirect_to request.referer
  end
end
