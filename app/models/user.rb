class User < ActiveRecord::Base
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'
  has_many :posts, through: :comments
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'
  
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
