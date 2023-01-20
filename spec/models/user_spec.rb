require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many posts' do
    post = FactoryBot.create(:post)
    user = post.user
    expect(user.posts).to include(post)
  end

  it 'has many comments' do
    comment = FactoryBot.create(:comment)
    user = comment.user
    expect(user.comments).to include(comment)
  end

  it 'name should be present' do
    user = FactoryBot.create(:user)
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'photo should be present' do
    user = FactoryBot.create(:user)
    user.photo = nil
    expect(user).to_not be_valid
  end

  it 'bio should be present' do
    user = FactoryBot.create(:user)
    user.bio = nil
    expect(user).to_not be_valid
  end

  it 'posts_counter should be present' do
    user = FactoryBot.create(:user)
    user.posts_counter = nil
    expect(user).to_not be_valid
  end

  it 'posts_counter should be an integer greater than or equal to zero' do
    user = FactoryBot.create(:user)
    user.posts_counter = -1
    expect(user).to_not be_valid
    user.posts_counter = 0
    expect(user).to be_valid
    user.posts_counter = 1
    expect(user).to be_valid
  end

  describe "#recent_posts" do
    it "returns the 3 most recent posts" do
      user = FactoryBot.create(:user)
      post1 = FactoryBot.create(:post, user: user, created_at: 1.day.ago)
      post2 = FactoryBot.create(:post, user: user, created_at: 2.days.ago)
      post3 = FactoryBot.create(:post, user: user, created_at: 3.days.ago)
      post4 = FactoryBot.create(:post, user: user, created_at: 4.days.ago)
  
      expect(user.recent_posts).to eq([post1, post2, post3])
    end
  end
end
