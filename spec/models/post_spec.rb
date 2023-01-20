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

  it 'title should not exceed 250 characters' do
    post = FactoryBot.create(:post)
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'comments_counter should be an integer greater than or equal to zero' do
    post = FactoryBot.create(:post)
    post.comments_counter = -1
    expect(post).to_not be_valid
    post.comments_counter = 0
    expect(post).to be_valid
    post.comments_counter = 1
    expect(post).to be_valid
  end

  it 'likes_counter should be an integer greater than or equal to zero' do
    post = FactoryBot.create(:post)
    post.likes_counter = -1
    expect(post).to_not be_valid
    post.likes_counter = 0
    expect(post).to be_valid
    post.likes_counter = 1
    expect(post).to be_valid
  end

  describe '#update_posts_counter' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post) }
    before do
      FactoryBot.create_list(:post, 2, user:)
    end

    it 'updates the posts counter on the user' do
      result = post.update_posts_counter
      count = user.reload.posts_counter
      expect(result).to be_truthy
      expect(count).to eq(2)
    end

    describe '#recent_comments' do
      let(:post) { FactoryBot.create(:post) }
      let(:comment) { FactoryBot.create(:comment) }
      before do
        FactoryBot.create_list(:comment, 10, post:)
      end
      it 'returns the 5 most recent comments' do
        expect(post.recent_comments).to eq(post.comments.order(created_at: :desc).limit(5))
      end
    end
  end
end
