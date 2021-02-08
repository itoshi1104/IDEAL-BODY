class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :sex, :profile_image)
  end
  
  def correct_user
    user = User.find(params[:id])
    if current_user != user
       redirect_to articles_path
    end
  end
  
end
