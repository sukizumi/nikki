class Public::UsersController < ApplicationController
  before_action :ensure_user, only: [:edit, :update]

  def index
    @posts = current_user.posts.order(date: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users

    begin
      start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : nil
      end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : nil

      if start_date && end_date && start_date > end_date
        flash[:alert] = "開始日は終了日より前にしてください"
        @posts = @user.posts.order(date: :desc)
      elsif start_date && end_date
        @posts = @user.posts.where(date: start_date..end_date).order(date: :desc)
      else
        @posts = @user.posts.order(date: :desc)
      end
    rescue ArgumentError
      flash[:alert] = "日付の形式が正しくありません"
      @posts = @user.posts.order(date: :desc)
    end
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
    redirect_to root_path
  end

  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @liked_posts = Post.find(likes)
  end

  def following
    user = User.find(params[:id])
    @users = user.following_users
  end

  def follower
    user = User.find(params[:id])
    @users = user.follower_users
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
