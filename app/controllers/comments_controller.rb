class CommentsController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
  
    def create
      article = Article.find(params[:article_id])
      
      comment = Comment.new(comment_params)
      comment.article_id = article.id
      comment.user_id = current_user.id
      if comment.save
        redirect_back(fallback_location: root_path)
      end
    end
  
    def destroy
    end
    
    private
  
  	def comment_params
  		params.require(:comment).permit(:body)
  	end
  	
    def correct_user
      user = User.find(params[:id])
      if current_user != user
         redirect_to articles_path
      end
    end


end
