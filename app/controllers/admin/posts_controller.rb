class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'ポスト削除完了'
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:date, :weight, :step, :food, :text).merge(user_id: current_user.id)
  end

end
