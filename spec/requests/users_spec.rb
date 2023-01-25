require 'rails_helper'
RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) } # create a user instance
  let(:post) { FactoryBot.create(:post, user:) } # create a post instance

  context 'GET /index' do
    it 'has successful response' do
      get '/'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/'
      expect(response).to render_template('index')
    end

    it 'has expected string in response' do
      get '/'
      expect(response.body).to include('This is the response body.')
    end
  end

  context 'GET /users/:user_id' do
    it 'has successful response' do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'has expected string in response' do
      get "/users/#{user.id}"
      expect(response.body).to include("A user's details and list of posts")
    end
  end

  context 'GET /users/:user_id/posts/:post_id' do
    it 'has successful response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:user_post)
    end

    it 'has expected string in response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include("A user's details and posts with associated comments")
    end
  end

  context 'GET /users/:user_id/posts' do
    it 'has successful response' do
      get "/users/#{user.id}/posts"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:user_posts)
    end

    it 'has expected string in response' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Post of a user with all comments')
    end
  end
end
