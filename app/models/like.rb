class Like < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_likes_for_posts

  def update_likes_for_posts
    post.likes_counter = post.likes.count
    post.save
  end
end
