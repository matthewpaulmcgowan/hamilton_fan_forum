class PostsController < ApplicationController
    before_action :require_login
    
    def show
      @post = Post.find_by(id: params[:id])
      @user =  @post.author  
      @comment = Comment.new
    end
    
    def new
      @user = current_user
      @post = Post.new
    end
    
    def create 
      @user = current_user 
      @post = @user.authored_posts.build(post_params)
      if @post.save
        redirect_to user_post_path(@user,@post)
      else
        render 'new'
      end
    end
    
    def destroy
      @user = User.find_by(id: params[:user_id]) 
      @post = Post.find_by(id: params[:id])
      if @user.id == current_user.id
        @post.delete 
        redirect_to user_path(@user)
      else
        flash[:alert] = "Cannot delete post you did not author"
        redirect_to user_path(@user)
      end
    end
    
    def edit
      @user = current_user 
      @post = Post.find_by(id: params[:id])
    end
    
    def update
      @post = Post.find_by(id: params[:id])
      @user = current_user
      if @post.update(post_params) && @user.id == @post.author.id   
        redirect_to user_post_path(@user,@post)
      else 
        render 'edit' 
      end
    end
    
private 
    def post_params 
      params.require(:post).permit(:content,:comments_attributes => [:content, :user_id]) 
    end
    
end
