class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end    
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

  def correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to root_path, alert: "その操作は許されません"
    end
  end
  
end
