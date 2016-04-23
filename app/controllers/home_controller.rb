class HomeController < ApplicationController 
   skip_before_filter :require_login
   
   def home 
       #binding.pry
   end
    
end