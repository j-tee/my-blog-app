require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'belongs to a user' do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, user:)
    expect(post.user).to eq(user)
  end

  it 'has many comments' do
    post = FactoryBot.create(:post)
    comment = FactoryBot.create(:comment, post:)
    expect(post.comments).to include(comment)
  end

  it 'title should be present' do
    post = FactoryBot.create(:post)
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'text should be present' do
    post = FactoryBot.create(:post)
    post.text = nil
    expect(post).to_not be_valid
  end

  it 'comments_counter should be present' do
    post = FactoryBot.create(:post)
    post.comments_counter = nil
    expect(post).to_not be_valid
  end

  it 'likes_counter should be present' do
    post = FactoryBot.create(:post)
    post.likes_counter = nil
    expect(post).to_not be_valid
  end
end
