class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  def destroy
    authorize! :delete, @comment
    @comment.destroy
    redirect_to user_post_comment_path(user_id: @comment.post.user_id, post_id: @comment.post_id, id: @comment.id), notice: 'Comment was successfully deleted.'
  end

  def create
    user = User.where(member_id: current_member.id).first
    @post = Post.where(user_id: user.id).first
    @comment = @post.comments.build(comment_params)
    @comment.user_id = user.id
    if @comment.valid?
      @comment.save
      flash[:notice] = 'Comment created successfully!'
    else
      flash[:error] = @comment.errors.full_messages.join(', ')
    end
    redirect_to user_post_path(user_id: user.id, id: @post.id)
  end

  def update; end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
