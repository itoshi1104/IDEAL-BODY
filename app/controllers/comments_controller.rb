class CommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def create
    article = Article.find(params[:article_id])

    comment = Comment.new(comment_params)
    comment.article_id = article.id
    comment.user_id = current_user.id
    redirect_back(fallback_location: root_path) if comment.save
  end

  def destroy
    comment = Comment.find(params[:article_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def correct_user
    comment = Comment.find(params[:article_id])
    redirect_to articles_path if current_user.id != comment.user_id
  end
end
