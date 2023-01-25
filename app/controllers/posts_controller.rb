class PostsController < ApplicationController
  def index
    @posts = Post.user_posts(params[:user_id]).paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.user_post(params[:user_id], params[:post_id])
  end
end
