class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  before_action :authorize_delete, only: [:destroy]

  def index
    @posts = Post.user_posts(params[:user_id]).paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.user_post(params[:user_id], params[:id])
  end

  def new
    @post = current_user.posts.new
    @post.comments_counter = 0
    @post.likes_counter = 0
  end

  def add_comment; end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.valid?
      @post.save
      flash[:notice] = 'Post created successfully!'
      redirect_to new_user_post_path(@user, @post)
    else
      flash[:error] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_delete
    return if can? :delete, @post

    redirect_to posts_path, notice: 'You are not authorized to delete this post.'
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
