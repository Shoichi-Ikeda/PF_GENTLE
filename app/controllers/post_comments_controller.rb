# frozen_string_literal: true
class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @wine = Wine.find(params[:wine_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.wine_id = @wine.id
    @post_comment.user_id = current_user.id
    @post_comment.score = Language.get_data(post_comment_params[:comment])
    if @post_comment.save
      redirect_to request.referer
    else
      flash[:comment_danger] = '※コメントを入力してください'
      redirect_to request.referer
    end
  end

  def destroy
    @wine = Wine.find(params[:wine_id])
    post_comment = @wine.post_comments.find(params[:id])
    post_comment.destroy
    redirect_to request.referer
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
