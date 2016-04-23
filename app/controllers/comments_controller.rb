class CommentsController < ApplicationController
    skip_before_filter :require_login
    
    def create
      @user = current_user
      @post = Post.find_by(id: params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user_id = @user.id 
      if @comment.save 
        redirect_to user_post_path(@user,@post) 
      else
        render 'posts/show'
      end
    end
    
    def destroy
      @comment = Comment.find_by(id: params[:id])
      @post = Post.find_by(id: params[:post_id])
      @user = @comment.user
      if @user.id == current_user.id
        @comment.delete 
        redirect_to user_post_path(@user,@post)
      else
        flash[:alert] = "Cannot delete Comment you did not write"
        redirect_to user_post_path(@user,@post)
      end
    end
    
private 
    def comment_params 
      params.require(:comment).permit(:content) 
    end
end
