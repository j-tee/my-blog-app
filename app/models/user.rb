class User < ApplicationRecord
  has_many :comments, class_name: 'comment', foreign_key: 'user_id'
  has_many :posts, through: :comments
  has_many :posts, class_name: 'post', foreign_key: 'user_id'
  has_many :posts, through: :likes
  has_many :likes, class_name: 'like', foreign_key: 'user_id'
end
