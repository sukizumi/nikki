class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to posts_path
    else
      
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'ポスト削除完了'
    redirect_to mypage_path
  end

  private

  def post_params
    params.require(:post).permit(:date, :weight, :step, :food, :text).merge(user_id: current_user.id)
  end
  
end
