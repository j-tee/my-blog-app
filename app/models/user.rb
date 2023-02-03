class User < ActiveRecord::Base
  belongs_to :member, class_name: 'Member', foreign_key: 'member_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'
  has_many :posts, through: :comments
  has_many :posts, class_name: 'Post', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'
  validates :name, presence: true, length: { in: 1..50 }
  validates :photo, presence: true, length: { in: 1..250 }
  validates :bio, presence: true, length: { in: 1..400 }
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.get_user(id)
    user = User.where(member_id: id).first
    if user.nil?
      user = new
      user.bio = generate_fake_bio
      user.photo = avatar_url(user)
      user.name = generate_fake_name
      user.member_id = id
      user.posts_counter=0;
      user.save      
    end
    user
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private
  def self.generate_fake_bio
    require 'faker'
    Faker::Lorem.paragraph(sentence_count: 5)
  end
  
  def self.generate_fake_name
    require 'faker'
    Faker::Name.name
  end
  def self.avatar_url(user)
    if user.photo.present?
      user.photo
    else
      "https://example.com/images/no_photo_avatar.png"
    end
  end
end
