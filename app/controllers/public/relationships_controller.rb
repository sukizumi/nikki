class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])

    respond_to do |format|
      format.js   # create.js.erb を使う
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])

    respond_to do |format|
      format.js   # destroy.js.erb を使う
    end
  end

end
