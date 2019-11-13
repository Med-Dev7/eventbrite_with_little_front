class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def update
    @user = User.all.find(params[:id])
    user_params = params.require(:user).permit(:first_name, :last_name, :description)
    @user.update(user_params)
    redirect_to user_path, :flash => {:success => "Vous bien update le gossip"} and return
   end


  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end