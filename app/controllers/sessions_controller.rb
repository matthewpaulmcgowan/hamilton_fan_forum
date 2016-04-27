class SessionsController < ApplicationController
   skip_before_action :require_login
   
   def new
     @user = User.new
   end
   
   def create
     if auth_hash = request.env["omniauth.auth"]
       user = User.find_or_create_by_omniauth(auth_hash)
       session[:user_id] = user.id 
       redirect_to user_path(user)
     else
      binding.pry
       @user = User.find_by(username: user_username)
       if @user && @user.authenticate(user_password)
         session[:user_id] = @user.id 
         redirect_to user_path(@user)
       else
         render 'sessions/new'  
       end
     end
   end
   
   def destroy
     if user_logged_in?
       session.destroy
       flash[:notice] = "Successfully logged out"
       redirect_to root_path 
     else
       flash[:alert] = "Must be logged in to log out"
       redirect_to root_path
     end
   end
   
private 

   def user_username
     params.require(:user).permit(:username)
   end
   
   def user_password
     params.require(:user).permit(:password)
   end
    
end