# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_currect_user, only: %i[edit update destroy]

  def index
    @user = User.all
    @wine = Wine.new
  end

  def show
    @user = User.find(params[:id])
    @wines = @user.wines
    @wine = Wine.new
  end

  def edit
    @wine = Wine.new
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def ensure_currect_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user.me?(current_user.id)
  end
end
