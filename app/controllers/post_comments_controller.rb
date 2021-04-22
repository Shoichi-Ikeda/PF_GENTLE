class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @wine = Wine.find(params[:wine_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.wine_id = @wine.id
    @post_comment.user_id = current_user.id
    if @post_comment.save
      redirect_to wine_path(@wine.id)
    else
      render 'wines/show'
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
