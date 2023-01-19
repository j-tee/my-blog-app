class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  def posts_counter
    user.posts_counter = user.posts.count
    user.save
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
