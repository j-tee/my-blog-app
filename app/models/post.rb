class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  validates :title, presence: true, length: { in: 1..250 }
  validates :text, presence: true, length: { in: 1..500 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_posts_counter

  def update_posts_counter
    user.posts_counter = user.posts.count
    user.save
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def self.user_post(user_id, post_id)
    Post.where(user_id:, id: post_id).includes(:comments, :user).first
  end

  def self.user_comments(user_id, post_id)
    Comment.where(user_id:, post_id:)
  end

  def self.user_posts(user_id)
    Post.where(user_id:)
  end
end
