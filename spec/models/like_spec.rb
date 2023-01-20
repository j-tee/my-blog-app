require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'belongs to a user' do
    user = FactoryBot.create(:user)
    like = FactoryBot.create(:like, user:)
    expect(like.user).to eq(user)
  end

  it 'belongs to a post' do
    post = FactoryBot.create(:post)
    like = FactoryBot.create(:like, post:)
    expect(like.post).to eq(post)
  end

  describe '#update_likes_for_posts' do
    post = FactoryBot.create(:post)
    like = FactoryBot.create(:like)
    before do
      FactoryBot.create_list(:like, 2, post:)
    end
    it 'updates the comments counter on the post' do
      expect(like.update_likes_for_posts).to be_truthy
      expect(post.reload.likes_counter).to be(2)
    end
  end
end
