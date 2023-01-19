class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  validates :title, presence: true, length: { in: 1..50 }
  validates :text, presence: true, length: { in: 1..500 }
  validates :comments_counter, presence: true, numericality: { only_integer: true }
  validates :likes_counter, presence: true, numericality: { only_integer: true }

  after_save :update_posts_counter
  def update_posts_counter
    user.posts_counter = user.posts.count
    user.save
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
