class Public::UsersController < ApplicationController
  before_action :ensure_user, only: [:edit, :update]

  def index
    @posts = Post.all.order(date: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザー削除完了'
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :gender, :height, :weight, :introduction, :goal)
  end

  def ensure_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end


end
