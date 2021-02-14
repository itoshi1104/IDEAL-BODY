class ArticlesController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def search
    # @search = Article.ransack(params[:q])
    # @search_articles = @search.result(distinct: true)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def correct_user
    article = Article.find(params[:id])
    redirect_to articles_path if current_user.id != article.user_id
  end
end
