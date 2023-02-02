require 'rails_helper'

RSpec.feature 'User posts index', type: :feature do
  let(:user) { FactoryBot.create(:user, name: 'Ego Dominus Tuus', photo: 'https://unsplash.com/photos/F_-0BxGuVvo') }
  posts = []

  before do
    10.times do |i|
      post = FactoryBot.create(:post, user:, title: "Post #{i + 1}", text: "Text for Post #{i + 1}")
      posts << post
    end
    visit user_posts_path(user_id: user.id)
  end

  scenario "I can see the user's profile picture" do
    expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')
  end

  scenario "I can see the user's username" do
    expect(page.body).to include(user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page.body).to include("10 posts written by #{posts.first.user.name}")
  end

  scenario "I can see a post's title" do
    expect(page).to have_content(posts.first.title)
  end

  scenario "I can see some of the post's body" do
    expect(page).to have_content(posts.first.text[0..100])
  end

  scenario 'I can see the first comments on a post' do
    post = Post.first
    comments = FactoryBot.create_list(:comment, 3, post:)
    visit user_posts_path(post.user_id)
    expect(page).to have_content(comments.first.text)
  end

  scenario 'I can see how many comments a post has' do
    expect(page.body).to include('comments: 0')
  end

  scenario 'I can see how many likes a post has' do
    expect(page.body).to include('likes: 0')
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    expect(page.body).to include('pagination')
  end

  scenario "When I click on a post, it redirects me to that post's show page" do
    post = posts.first
    expect(user_post_path(post.user_id, post.id)).to eq("/users/#{post.user_id}/posts/#{post.id}")
  end
end

RSpec.feature 'Post show', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user:) }

  before do
    5.times { FactoryBot.create(:comment, post:, user: FactoryBot.create(:user)) }
    10.times { post.likes.create(user: FactoryBot.create(:user)) }
    visit user_post_path(user, post)
  end

  scenario "I can see the post's title" do
    expect(page.body).to include(post.title)
  end

  scenario 'I can see the post body' do
    expect(page).to have_content(post.text)
  end

  scenario 'I can see the username of each commentor' do
    expect(page.body).to include(post.user.name)
  end

  scenario 'I can see the comment each commentor left' do
    post.comments.each do |comment|
      expect(page.body).to include(comment.text)
    end
  end
  scenario 'I can see who wrote the post' do
    expect(page.body).to include("by #{post.user.name}")
  end

  scenario 'I can see how many comments it has' do
    expect(page).to have_content('comments: 5')
  end

  scenario 'I can see how many likes it has' do
    expect(page).to have_content('likes: 10')
  end
end
