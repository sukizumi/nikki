class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザー削除完了'
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :gender, :height, :weight, :introduction, :goal)
  end

end
