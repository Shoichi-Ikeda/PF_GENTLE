class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @wines = @user.wines
    @wine = Wine.new
  end

  def index
    @users = User.all
    @wine = Wine.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
