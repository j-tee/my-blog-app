class Comment < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_comments_for_post
    post.comments_counter = post.comments.count
  end
end