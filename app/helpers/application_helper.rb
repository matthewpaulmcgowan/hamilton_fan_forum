module ApplicationHelper
  
  def user_logged_in?
    !!current_user 
  end
  
  def current_user 
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user 
    end
  end
  
  def require_login
    if !user_logged_in?
      flash[:alert] = "User Not Signed In"
      redirect_to root_path
    end
  end
  
  def current_users_page(user)
    current_user.id == user.id      
  end
  
  def comment_author(comment)
    current_user.id == comment.user.id  
  end
    
end
