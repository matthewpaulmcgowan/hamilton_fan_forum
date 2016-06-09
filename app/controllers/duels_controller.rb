class DuelsController < ApplicationController

   def show
     @user = User.find(params[:user_id])
     @duel = Duel.find(params[:id])
   end

   def index
     @user = User.find(params[:user_id])
     @duels = @user.duels
   end

   def create
     #need to user params to create an outcome and save the opponnett, then create a new duel
     #create an out come using if/else statement
   end
end
