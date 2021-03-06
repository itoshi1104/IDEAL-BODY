class FavoritesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    favorite = Favorite.new(user_id: current_user.id, article_id: article.id)
    favorite.save
    article.create_notification_favorite!(current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    article = Article.find(params[:article_id])
    favorite = current_user.favorites.find_by(article_id: article.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
