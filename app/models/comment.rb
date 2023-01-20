class Comment < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  validates :text, presence: true, length: { in: 1..500 }

  after_save :update_comments_for_post
  def update_comments_for_post
    post.comments_counter = post.comments.count
    post.save
  end
end
