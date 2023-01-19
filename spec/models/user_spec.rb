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
end
