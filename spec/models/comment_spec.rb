require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'belongs to a user' do
    user = FactoryBot.create(:user)
    comment = FactoryBot.create(:comment, user:)
    expect(comment.user).to eq(user)
  end

  it 'belongs to a post' do
    post = FactoryBot.create(:post)
    comment = FactoryBot.create(:comment, post:)
    expect(comment.post).to eq(post)
  end

  it 'text should be present' do
    comment = FactoryBot.create(:comment)
    comment.text = nil
    expect(comment).to_not be_valid
  end

  describe '#update_comments_for_post' do
    post = FactoryBot.create(:post)
    comment = FactoryBot.create(:comment)
    before do
      FactoryBot.create_list(:comment, 2, post:)
    end
    it 'updates the comments counter on the post' do
      expect(comment.update_comments_for_post).to be_truthy
      expect(post.reload.comments_counter).to be(2)
    end
  end
end
