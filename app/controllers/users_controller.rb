class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html { render :show }
      format.json
    end
  end

  def user_posts
    @posts = Post.user_posts(params[:user_id])
  end

  def user_post
    @post = Post.user_post(params[:user_id], params[:post_id])
  end
end
