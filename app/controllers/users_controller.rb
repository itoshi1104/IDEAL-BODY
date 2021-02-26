class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @article = Article.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :sex, :profile_image)
  end

  def correct_user
    user = User.find(params[:id])
    redirect_to articles_path if current_user != user
  end
end
