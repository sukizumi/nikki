class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @word = params[:word]

    if @model == "User"
      @users = User.looks(params[:word])
    else
      @posts = Post.looks(params[:word])
    end
  end
end
