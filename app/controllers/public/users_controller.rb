class Public::UsersController < ApplicationController
  def mypage
    @posts = Post.all
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :height, :weight, :introduction, :goal)
  end

end
