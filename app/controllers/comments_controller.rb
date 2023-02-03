class CommentsController < ApplicationController
  def create
    @post = Post.where(user_id: current_user.id).first
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.valid?
      @comment.save
      flash[:notice] = 'Comment created successfully!'
    else
      flash[:error] = @comment.errors.full_messages.join(', ')
    end
    redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
  end

  def update; end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :delete, @comment
    @comment.destroy
    redirect_to comments_path, notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id)
  end
end
