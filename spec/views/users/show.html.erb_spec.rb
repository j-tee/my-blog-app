require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  let(:user) { FactoryBot.create(:user, photo: 'https://unsplash.com/photos/F_-0BxGuVvo') }
  let(:posts) { FactoryBot.create_list(:post, 3, user:, text: 'This is my post') }

  before do
    visit user_path(id: user.id)
  end

  it "displays the user's profile picture" do
    expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')
  end

  it "displays the user's username" do
    expect(page).to have_content(user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content("number of posts: #{user.posts_counter}")
  end

  it "displays the user's bio" do
    expect(page).to have_content("Bio #{user.bio}")
  end

  it "displays the user's first 3 posts" do
    user.recent_posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it "displays a button that lets me view all of a user's posts" do
    expect(page.body).to have_content('Show All Posts')
  end
end
