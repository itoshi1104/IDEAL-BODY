class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article(article_params)
    @article.user_id = current_user_id
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
    @article = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
     @article = Article.find(params[:id])
    if@article.update(article_params)
      redirect_to article_path
    else
      render 'edit'
    end
  end

  def destroy
     @article = Article.find(params[:id])
     @article.destroy
     redirect_to articles_path
  end


private

  def article_params
    params.require(:article).permit(:title, :body,)
  end




end
