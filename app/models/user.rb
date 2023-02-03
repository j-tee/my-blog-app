class User < ActiveRecord::Base
  belongs_to :member, class_name: 'member', foreign_key: 'member_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'
  has_many :posts, through: :comments
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'
  validates :name, presence: true, length: { in: 1..50 }
  validates :photo, presence: true, length: { in: 1..250 }
  validates :bio, presence: true, length: { in: 1..400 }
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
