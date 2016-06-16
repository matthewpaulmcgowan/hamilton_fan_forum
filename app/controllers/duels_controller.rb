class DuelsController < ApplicationController

   def show
     @user = User.find(params[:user_id])
     @duel = Duel.find(params[:id])
   end

   def index
     @user = User.find(params[:user_id])
     @duels = @user.duels
   end

   def new
     @user = User.find(params[:user_id])
   end

   def create
     @user = User.find(params[:user_id])
     @duel = @user.duels.build(competitor: params[:competitor])
     @duel.determine_outcome
     @duel.save
     @user.update_dueling_ability(@duel.outcome)
     render json: @duel
   end
end
