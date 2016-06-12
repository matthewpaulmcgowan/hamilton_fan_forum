class UsersController < ApplicationController
   skip_before_action :require_login, only: [:new, :create]

   def new
     @user = User.new
   end

   def create
     @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       render 'new'
     end
   end

   def show
     @user = User.find_by(id: params[:id])
     respond_to do |f|
       f.html { render :show }
       f.json { render json: @user }
     end
   end

   def edit
     @user = current_user
   end

   def update
     @user = current_user
     if @user.update(user_params)
       redirect_to user_path(@user)
     else
       render 'edit'
     end
   end

   def index
     @user = current_user
     @users = User.all_with_posts
   end

   def destroy
     @user = User.find_by(id: params[:id])
     if @user.id == current_user.id
       session.destroy
       @user.delete
       flash[:notice] = "Successfully logged out"
       redirect_to root_path
     else
       flash[:alert] = "Can only delete your own profile"
       redirect_to user_path(@user)
     end
   end

   def wall_of_fame
     @users = User.viewed_hamilton
   end

   def commented_posts
     @user = current_user
   end

private

   def user_params
     params.require(:user).permit(:username,:password,:listened_to_soundtrack,:favorite_actor,:favorite_song,:favorite_Daveed_Diggs_character,:lmm_national_treasure,:viewed_hamilton,:ham_or_burr_have_better_songs)
   end

end
