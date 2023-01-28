class LikesController < ApplicationController
  protect_from_forgery with: :exception
  def create
    @like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
    if @like.save?
      flash.now[:success] = 'Like successfully created!'
    else
      flash.now[:error] = 'An error occurred while creating the like. Please try again.'
    end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end
