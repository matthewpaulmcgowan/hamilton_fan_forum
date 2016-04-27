class HomeController < ApplicationController 
   skip_before_action :require_login
   
   def home 
     if user_logged_in?
       redirect_to user_path(current_user)
     end
   end
    
end