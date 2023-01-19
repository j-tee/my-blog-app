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
end
