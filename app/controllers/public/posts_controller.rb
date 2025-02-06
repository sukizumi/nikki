class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :date, :weight, :step, :food, :text)
  end
  
end
